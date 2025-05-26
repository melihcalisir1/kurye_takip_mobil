import 'package:flutter/material.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({Key? key}) : super(key: key);

  @override
  _OrderManagementScreenState createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sipariş Yönetimi'),
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Bekleyen'),
              Tab(text: 'Hazırlanan'),
              Tab(text: 'Tamamlanan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList('Bekleyen'),
            _buildOrderList('Hazırlanan'),
            _buildOrderList('Tamamlanan'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Yeni sipariş oluştur
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Widget _buildOrderList(String status) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildOrderCard(
          'Sipariş #${1000 + index}',
          'Ahmet Yılmaz',
          '₺${(index + 1) * 50}',
          status,
        );
      },
    );
  }

  Widget _buildOrderCard(
    String orderId,
    String customerName,
    String total,
    String status,
  ) {
    Color statusColor;
    switch (status) {
      case 'Bekleyen':
        statusColor = Colors.orange;
        break;
      case 'Hazırlanan':
        statusColor = Colors.blue;
        break;
      case 'Tamamlanan':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

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
                  orderId,
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
                const Icon(Icons.person, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(customerName),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.attach_money, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  total,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Siparişi düzenle
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Düzenle'),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    // Sipariş detayları
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