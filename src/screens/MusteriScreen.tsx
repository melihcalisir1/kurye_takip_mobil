// screens/MusteriScreen.tsx

import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Alert,
  ScrollView
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useNavigation } from '@react-navigation/native';

const MusteriScreen = () => {
  const navigation = useNavigation<any>();
  const [userName, setUserName] = useState('');

  useEffect(() => {
    const loadUser = async () => {
      const userData = await AsyncStorage.getItem('user');
      if (userData) {
        const parsed = JSON.parse(userData);
        setUserName(parsed.name || 'Müşteri');
      }
    };

    loadUser();
  }, []);

  const handleLogout = async () => {
    await AsyncStorage.removeItem('token');
    await AsyncStorage.removeItem('user');

    navigation.reset({
      index: 0,
      routes: [{ name: 'Login' }],
    });
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.header}>👋 Merhaba, {userName}</Text>
      <Text style={styles.subtext}>Nasılsın bugün? Ne yapmak istersin?</Text>

      <View style={styles.menu}>
        <TouchableOpacity
          style={styles.card}
          onPress={() => navigation.navigate('OrderCreate')}
        >
          <Text style={styles.cardText}>📝 Yeni Sipariş Ver</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.card}
          onPress={() => navigation.navigate('OrderList')}
        >
          <Text style={styles.cardText}>📦 Siparişlerim</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.card}
          onPress={() => navigation.navigate('Profile')}
        >
          <Text style={styles.cardText}>👤 Profilim</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={[styles.card, styles.logoutCard]}
          onPress={handleLogout}
        >
          <Text style={[styles.cardText, { color: '#fff' }]}>🚪 Çıkış Yap</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

export default MusteriScreen;

const styles = StyleSheet.create({
  container: {
    paddingVertical: 60,
    paddingHorizontal: 24,
    backgroundColor: '#f2f4f7',
    flexGrow: 1,
  },
  header: {
    fontSize: 24,
    fontWeight: '600',
    textAlign: 'center',
    marginBottom: 10,
  },
  subtext: {
    fontSize: 16,
    textAlign: 'center',
    color: '#555',
    marginBottom: 30,
  },
  menu: {
    flexDirection: 'column',
    gap: 16,
  },
  card: {
    backgroundColor: '#fff',
    borderRadius: 12,
    paddingVertical: 20,
    paddingHorizontal: 18,
    elevation: 3,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 3 },
  },
  cardText: {
    fontSize: 18,
    fontWeight: '500',
    color: '#333',
  },
  logoutCard: {
    backgroundColor: '#e74c3c',
    marginTop: 30,
  },
});
