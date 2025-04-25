import React, { useState } from 'react';
import { View, TextInput, Button, Text, Alert, StyleSheet, TouchableOpacity } from 'react-native';
import axios from 'axios';
import { useNavigation } from '@react-navigation/native';

const RegisterScreen = () => {
  const navigation = useNavigation<any>();

  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');

  const handleRegister = async () => {
    if (password !== passwordConfirm) {
      Alert.alert('Hata', 'Şifreler uyuşmuyor.');
      return;
    }

    try {
      const res = await axios.post('http://10.0.2.2:8000/api/register', {
        name,
        email,
        password,
        password_confirmation: passwordConfirm
      });

      Alert.alert('Başarılı', 'Kayıt başarılı! Giriş ekranına yönlendiriliyorsunuz.');
      navigation.navigate('Login');
    } catch (error: any) {
      console.log('Kayıt Hatası:', error?.response?.data);

      if (error.response && error.response.data) {
        const errors = error.response.data.errors;

        if (errors) {
          const firstError = Object.values(errors)[0][0]; // İlk hata mesajı
          Alert.alert('Hata', firstError);
        } else if (error.response.data.message) {
          Alert.alert('Hata', error.response.data.message);
        } else {
          Alert.alert('Hata', 'Kayıt sırasında bilinmeyen bir hata oluştu.');
        }
      } else {
        Alert.alert('Hata', 'Sunucuya ulaşılamıyor. Bağlantıyı kontrol et.');
      }
    }
  };

  const goBackToLogin = () => {
    navigation.navigate('Login');
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity onPress={goBackToLogin} style={styles.backButton}>
        <Text style={styles.backText}>← Giriş ekranına dön</Text>
      </TouchableOpacity>

      <Text style={styles.title}>📝 Kayıt Ol</Text>
      <TextInput
        placeholder="Ad Soyad"
        value={name}
        onChangeText={setName}
        style={styles.input}
      />
      <TextInput
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        style={styles.input}
        keyboardType="email-address"
        autoCapitalize="none"
      />
      <TextInput
        placeholder="Şifre"
        secureTextEntry
        value={password}
        onChangeText={setPassword}
        style={styles.input}
      />
      <TextInput
        placeholder="Şifre Tekrar"
        secureTextEntry
        value={passwordConfirm}
        onChangeText={setPasswordConfirm}
        style={styles.input}
      />
      <Button title="Kayıt Ol" onPress={handleRegister} />
    </View>
  );
};

export default RegisterScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  backButton: {
    position: 'absolute',
    top: 50,
    left: 20,
    padding: 6,
    zIndex: 10,
  },
  backText: {
    color: '#007bff',
    fontSize: 16,
  },
  title: {
    fontSize: 24,
    marginBottom: 20,
    alignSelf: 'center',
    fontWeight: 'bold',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 6,
    padding: 10,
    marginBottom: 12,
  },
});
