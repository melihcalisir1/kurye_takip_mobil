import React from 'react';
import { View, Text, StyleSheet, Button } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { useAuth } from '../context/AuthContext';

const AdminPanel = () => {
  const navigation = useNavigation<any>();
  const { logout } = useAuth();

  return (
    <View style={styles.container}>
      <Text style={styles.title}>👑 Admin Paneli</Text>
      <Text style={styles.subText}>Hoşgeldiniz! Buradan şirket sahibi ekleyebilirsiniz.</Text>

      <View style={styles.buttonContainer}>
        <Button
          title="Şirket Sahibi Oluştur"
          onPress={() => navigation.navigate('CreateSirket')}
          color="#0066cc"
        />
      </View>

      <View style={styles.buttonContainer}>
        <Button
          title="Çıkış Yap"
          onPress={logout}
          color="#cc0000"
        />
      </View>
    </View>
  );
};

export default AdminPanel;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 24,
    backgroundColor: '#f4f4f4',
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    marginBottom: 8,
    textAlign: 'center',
  },
  subText: {
    fontSize: 16,
    marginBottom: 24,
    textAlign: 'center',
    color: '#555',
  },
  buttonContainer: {
    marginBottom: 16,
  },
});
