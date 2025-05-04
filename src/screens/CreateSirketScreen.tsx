import React, { useState } from 'react';
import { View, TextInput, Button, Text, StyleSheet, Alert } from 'react-native';
import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useNavigation } from '@react-navigation/native'; // ← navigation eklendi

const CreateSirketScreen = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');

  const navigation = useNavigation<any>(); // ← hook kullanımı

  const handleCreate = async () => {
    if (!name || !email || !password) {
      Alert.alert('Hata', 'Ad, email ve şifre zorunludur.');
      return;
    }

    try {
      const token = await AsyncStorage.getItem('token');

      const response = await axios.post(
        'http://10.0.2.2:8000/api/admin/create-sirket',
        {
          name,
          email,
          phone,
          password,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: 'application/json',
          },
        }
      );

      Alert.alert('Başarılı', 'Şirket sahibi oluşturuldu.');

      // inputları temizle
      setName('');
      setEmail('');
      setPhone('');
      setPassword('');

      // AdminPanel'e yönlendirme
      navigation.reset({
        index: 0,
        routes: [{ name: 'AdminPanel' }],
      });

    } catch (err: any) {
      console.log(err.response?.data);
      Alert.alert('Hata', 'Bir sorun oluştu.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🏢 Yeni Şirket Sahibi Ekle</Text>
      <TextInput placeholder="Ad Soyad" style={styles.input} value={name} onChangeText={setName} />
      <TextInput placeholder="Email" style={styles.input} value={email} onChangeText={setEmail} />
      <TextInput placeholder="Telefon" style={styles.input} value={phone} onChangeText={setPhone} />
      <TextInput placeholder="Şifre" style={styles.input} value={password} onChangeText={setPassword} secureTextEntry />
      <Button title="Ekle" onPress={handleCreate} />
    </View>
  );
};

export default CreateSirketScreen;

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: 'center' },
  title: { fontSize: 20, fontWeight: 'bold', marginBottom: 20, textAlign: 'center' },
  input: { borderWidth: 1, borderColor: '#ccc', marginBottom: 12, padding: 10, borderRadius: 6, backgroundColor: '#fff' },
});
