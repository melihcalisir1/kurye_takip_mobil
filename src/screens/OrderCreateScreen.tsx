import React, { useState } from 'react';
import { View, TextInput, Button, Text, Alert, StyleSheet } from 'react-native';
import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useNavigation } from '@react-navigation/native';

const OrderCreateScreen = () => {
  const [pickupAddress, setPickupAddress] = useState('');
  const [deliveryAddress, setDeliveryAddress] = useState('');
  const navigation = useNavigation<any>();

  const handleCreateOrder = async () => {
    if (!pickupAddress || !deliveryAddress) {
      Alert.alert('Hata', 'Tüm alanları doldurman gerekiyor.');
      return;
    }

    try {
      const token = await AsyncStorage.getItem('token');

      const res = await axios.post(
        'http://10.0.2.2:8000/api/orders',
        {
          pickup_address: pickupAddress,
          delivery_address: deliveryAddress,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: 'application/json',
          },
        }
      );

      Alert.alert('Başarılı', 'Sipariş başarıyla oluşturuldu!');
      setPickupAddress('');
      setDeliveryAddress('');
      navigation.goBack(); // Veya OrderListScreen'e yönlendirebilirsin
    } catch (err: any) {
      console.log('Hata:', err.response?.data);
      Alert.alert('Hata', 'Sipariş oluşturulamadı.');
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>📦 Yeni Sipariş Ver</Text>

      <TextInput
        style={styles.input}
        placeholder="Alım Adresi"
        value={pickupAddress}
        onChangeText={setPickupAddress}
      />

      <TextInput
        style={styles.input}
        placeholder="Teslimat Adresi"
        value={deliveryAddress}
        onChangeText={setDeliveryAddress}
      />

      <Button title="Sipariş Ver" onPress={handleCreateOrder} />
    </View>
  );
};

export default OrderCreateScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
    backgroundColor: '#f9f9f9',
  },
  title: {
    fontSize: 22,
    fontWeight: 'bold',
    marginBottom: 24,
    textAlign: 'center',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    padding: 12,
    marginBottom: 16,
    backgroundColor: '#fff',
  },
});
