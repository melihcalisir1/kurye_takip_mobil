import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menü Yönetimi'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(
            'Menü Oluştur',
            Icons.add_circle_outline,
            () {
              // Menü oluşturma sayfasına git
            },
          ),
          _buildMenuCard(
            'Menüleri Listele',
            Icons.list_alt,
            () {
              // Menü listesi sayfasına git
            },
          ),
          _buildMenuCard(
            'Kategoriler',
            Icons.category,
            () {
              // Kategori yönetimi sayfasına git
            },
          ),
          _buildMenuCard(
            'Fiyat Güncelle',
            Icons.price_change,
            () {
              // Fiyat güncelleme sayfasına git
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni menü öğesi ekle
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildMenuCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
} 