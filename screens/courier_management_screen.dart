import 'package:flutter/material.dart';

class CourierManagementScreen extends StatefulWidget {
  const CourierManagementScreen({Key? key}) : super(key: key);

  @override
  _CourierManagementScreenState createState() => _CourierManagementScreenState();
}

class _CourierManagementScreenState extends State<CourierManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurye Yönetimi'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCourierCard(
            'Ahmet Yılmaz',
            'Aktif',
            '+90 555 123 4567',
            '5 Teslimat',
            Colors.green,
          ),
          _buildCourierCard(
            'Mehmet Demir',
            'Müsait',
            '+90 555 987 6543',
            '2 Teslimat',
            Colors.blue,
          ),
          _buildCourierCard(
            'Ayşe Kaya',
            'İzinli',
            '+90 555 456 7890',
            '0 Teslimat',
            Colors.orange,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni kurye ekle
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildCourierCard(
    String name,
    String status,
    String phone,
    String deliveryCount,
    Color statusColor,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.phone, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(phone),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.local_shipping, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(deliveryCount),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Kurye düzenle
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Düzenle'),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    // Kurye detayları
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Detaylar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 