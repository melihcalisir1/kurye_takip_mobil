import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bildirimler'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              // Tüm bildirimleri temizle
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationCard(
            'Yeni Sipariş',
            'Sipariş #1234 için yeni teslimat atandı',
            '5 dakika önce',
            Icons.shopping_cart,
            Colors.blue,
          ),
          _buildNotificationCard(
            'Teslimat Tamamlandı',
            'Sipariş #1233 başarıyla teslim edildi',
            '1 saat önce',
            Icons.check_circle,
            Colors.green,
          ),
          _buildNotificationCard(
            'Sistem Güncellemesi',
            'Uygulama yeni sürüme güncellendi',
            '2 saat önce',
            Icons.system_update,
            Colors.orange,
          ),
          _buildNotificationCard(
            'Ödeme Bildirimi',
            '₺150 ödeme hesabınıza yatırıldı',
            '1 gün önce',
            Icons.payment,
            Colors.purple,
          ),
          _buildNotificationCard(
            'Acil Durum',
            'Sipariş #1232 için müşteri araması',
            '2 gün önce',
            Icons.warning,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    String title,
    String message,
    String time,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Bildirim seçenekleri
          },
        ),
        onTap: () {
          // Bildirime tıklandığında
        },
      ),
    );
  }
} 