import React from 'react';
import { View, Text, StyleSheet, Button } from 'react-native';
import { useAuth } from '../context/AuthContext';

const SirketDashboard = () => {
  const { logout } = useAuth();

  return (
    <View style={styles.container}>
      <Text style={styles.text}>🏢 Şirket Sahibi Paneli</Text>
      <Button title="Çıkış Yap" onPress={logout} />
    </View>
  );
};

export default SirketDashboard;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 12,
    backgroundColor: '#fff',
  },
  text: {
    fontSize: 20,
    fontWeight: 'bold',
  },
});
