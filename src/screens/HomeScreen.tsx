import React from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const HomeScreen = ({ navigation }: any) => {
  const handleLogout = async () => {
    await AsyncStorage.removeItem('auth_token');
    navigation.replace('Login');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🏠 Ana Sayfa</Text>
      <Text>Giriş başarılı! Token bulundu.</Text>
      <Button title="Çıkış Yap" onPress={handleLogout} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  },
  title: {
    fontSize: 22,
    fontWeight: 'bold',
    marginBottom: 20
  }
});

export default HomeScreen;
