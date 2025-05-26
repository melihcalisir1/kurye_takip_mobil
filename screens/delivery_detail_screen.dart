import 'package:flutter/material.dart';

class DeliveryDetailScreen extends StatefulWidget {
  final String deliveryId;
  
  const DeliveryDetailScreen({
    Key? key,
    required this.deliveryId,
  }) : super(key: key);

  @override
  _DeliveryDetailScreenState createState() => _DeliveryDetailScreenState();
}

class _DeliveryDetailScreenState extends State<DeliveryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teslimat Detayı'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              'Teslimat Bilgileri',
              [
                _buildInfoRow('Teslimat No', '#${widget.deliveryId}'),
                _buildInfoRow('Durum', 'Yolda'),
                _buildInfoRow('Tarih', '01.01.2024'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Müşteri Bilgileri',
              [
                _buildInfoRow('Ad Soyad', 'Ahmet Yılmaz'),
                _buildInfoRow('Telefon', '+90 555 123 4567'),
                _buildInfoRow('Adres', 'Atatürk Cad. No:123 Kadıköy/İstanbul'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Ürün Bilgileri',
              [
                _buildInfoRow('Ürün', 'Kırmızı Gül Buketi'),
                _buildInfoRow('Not', 'Özel gün için hazırlanmıştır'),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Teslimatı tamamla
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Teslimatı Tamamla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
} 