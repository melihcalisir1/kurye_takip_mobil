import React, { useState } from 'react';
import { View, TextInput, Button, Text, Alert } from 'react-native';
import axios from 'axios';

const RegisterScreen = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirm, setPasswordConfirm] = useState('');

  const handleRegister = async () => {
    try {
      const res = await axios.post('http://10.0.2.2:8000/api/register', {
        name,
        email,
        password,
        password_confirmation: passwordConfirm
      });

      Alert.alert('Kayıt Başarılı', `Token: ${res.data.token}`);
      console.log(res.data);
    } catch (error) {
      console.log(error.response?.data);
      Alert.alert('Hata', 'Kayıt sırasında bir hata oluştu.');
    }
  };

  return (
    <View style={{ padding: 20 }}>
      <TextInput placeholder="Ad" value={name} onChangeText={setName} style={{ marginBottom: 10 }} />
      <TextInput placeholder="Email" value={email} onChangeText={setEmail} style={{ marginBottom: 10 }} />
      <TextInput placeholder="Şifre" secureTextEntry value={password} onChangeText={setPassword} style={{ marginBottom: 10 }} />
      <TextInput placeholder="Şifre Tekrar" secureTextEntry value={passwordConfirm} onChangeText={setPasswordConfirm} style={{ marginBottom: 10 }} />
      <Button title="Kayıt Ol" onPress={handleRegister} />
    </View>
  );
};

export default RegisterScreen;
