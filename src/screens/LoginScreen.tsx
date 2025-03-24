import React, { useState } from 'react';
import { View, TextInput, Button, StyleSheet, Alert, Text } from 'react-native';
import axios from 'axios';
import { useAuth } from '../context/AuthContext';

const LoginScreen: React.FC = () => {
  const { login } = useAuth(); // AuthContext'ten login fonksiyonu alınıyor
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    try {
      const response = await axios.post('http://10.0.2.2:8000/api/login', {
        email,
        password,
      });

      const { token, user } = response.data;

      // Global auth context'te login işlemi yapılıyor
      await login(token, user);

    } catch (error: any) {
      console.log('Login error:', error?.response?.data || error.message);
      Alert.alert('Hata', 'Giriş başarısız. Bilgileri kontrol et.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🔐 Giriş Yap</Text>
      <TextInput
        placeholder="E-posta"
        value={email}
        onChangeText={setEmail}
        style={styles.input}
        autoCapitalize="none"
      />
      <TextInput
        placeholder="Şifre"
        value={password}
        onChangeText={setPassword}
        style={styles.input}
        secureTextEntry
      />
      <Button title="Giriş Yap" onPress={handleLogin} />
    </View>
  );
};

export default LoginScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: '#fff',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 6,
    padding: 10,
    marginBottom: 12,
  },
  title: {
    fontSize: 24,
    marginBottom: 20,
    alignSelf: 'center',
    fontWeight: 'bold',
  },
});
