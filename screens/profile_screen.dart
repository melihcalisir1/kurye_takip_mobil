import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
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
              'Ahmet Yılmaz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Kurye',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              'Kişisel Bilgiler',
              [
                _buildInfoRow('Telefon', '+90 555 123 4567'),
                _buildInfoRow('E-posta', 'ahmet@example.com'),
                _buildInfoRow('Adres', 'Kadıköy, İstanbul'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'İstatistikler',
              [
                _buildInfoRow('Toplam Teslimat', '156'),
                _buildInfoRow('Aktif Teslimat', '3'),
                _buildInfoRow('Puan', '4.8'),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Ayarlar',
              [
                _buildSettingRow(
                  'Bildirimler',
                  Icons.notifications,
                  true,
                ),
                _buildSettingRow(
                  'Konum Paylaşımı',
                  Icons.location_on,
                  true,
                ),
                _buildSettingRow(
                  'Karanlık Mod',
                  Icons.dark_mode,
                  false,
                ),
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