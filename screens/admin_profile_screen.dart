import 'package:flutter/material.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({Key? key}) : super(key: key);

  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Profili'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Profili düzenle
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Admin Kullanıcı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Sistem Yöneticisi',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              'Yönetim Paneli',
              [
                _buildMenuCard(
                  'Kurye Yönetimi',
                  Icons.local_shipping,
                  () {
                    // Kurye yönetimi sayfasına git
                  },
                ),
                _buildMenuCard(
                  'Sipariş Yönetimi',
                  Icons.shopping_cart,
                  () {
                    // Sipariş yönetimi sayfasına git
                  },
                ),
                _buildMenuCard(
                  'Menü Yönetimi',
                  Icons.restaurant_menu,
                  () {
                    // Menü yönetimi sayfasına git
                  },
                ),
                _buildMenuCard(
                  'Raporlar',
                  Icons.bar_chart,
                  () {
                    // Raporlar sayfasına git
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Sistem Ayarları',
              [
                _buildSettingRow(
                  'Bildirimler',
                  Icons.notifications,
                  true,
                ),
                _buildSettingRow(
                  'Kullanıcı Yönetimi',
                  Icons.people,
                  true,
                ),
                _buildSettingRow(
                  'Yedekleme',
                  Icons.backup,
                  false,
                ),
                _buildSettingRow(
                  'Güvenlik',
                  Icons.security,
                  true,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'İstatistikler',
              [
                _buildInfoRow('Toplam Kurye', '12'),
                _buildInfoRow('Aktif Siparişler', '45'),
                _buildInfoRow('Günlük Teslimat', '156'),
                _buildInfoRow('Aylık Gelir', '₺45,678'),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Çıkış yap
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Çıkış Yap',
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

  Widget _buildMenuCard(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingRow(
    String title,
    IconData icon,
    bool value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          Switch(
            value: value,
            onChanged: (newValue) {
              // Ayarı değiştir
            },
          ),
        ],
      ),
    );
  }
} 