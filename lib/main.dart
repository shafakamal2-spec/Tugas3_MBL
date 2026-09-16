import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const TeamDirectoryPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: PricingCard(),
      ),
    );
  }
}

// ============================================================
// TUGAS 1: Widget & Layouting - Kartu Harga Layanan IT
// ============================================================
class PricingCard extends StatelessWidget {
  const PricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.laptop_mac, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                const Text('Paket Profesional',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                const Text('Solusi lengkap untuk kebutuhan bisnis Anda',
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 16),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('Rp 5.000.000',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Text('/ proyek', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 16),
                const FeatureRow(text: 'Desain UI/UX Khusus'),
                const SizedBox(height: 8),
                const FeatureRow(text: 'Setup Database'),
                const SizedBox(height: 8),
                const FeatureRow(text: 'Support 24/7'),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Pilih Paket'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Rekomendasi',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String text;
  const FeatureRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check, size: 18, color: Colors.green),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

// ============================================================
// TUGAS 2: Routing & Navigation
// Layer 1: StatelessWidget + ListView + ListTile (sesuai ketentuan)
// Layer 2: StatefulWidget + Column + Icon + Text + Container bio pastel
// ============================================================

class TeamDirectoryPage extends StatelessWidget {
  const TeamDirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> users = [
      {
        'name': 'Budi Santoso',
        'bio': 'Mahasiswa Ilmu Komputer, suka ngoding Flutter dan ngulik UI baru tiap minggu.',
        'role': 'Mobile Developer',
        'color': const Color(0xFF4A6CF7),
        'icon': Icons.smartphone,
      },
      {
        'name': 'Siti Aminah',
        'bio': 'UI/UX Designer, hobi bikin mockup Figma dan riset pengalaman pengguna.',
        'role': 'UI/UX Designer',
        'color': const Color(0xFFEC4899),
        'icon': Icons.brush,
      },
      {
        'name': 'Andi Wijaya',
        'bio': 'Backend Developer, jago urusan database dan optimasi server.',
        'role': 'Backend Developer',
        'color': const Color(0xFF14B8A6),
        'icon': Icons.storage,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header gradient ala mobile app
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4A6CF7), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Anggota',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: const Icon(Icons.notifications_none, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${users.length} anggota tim aktif hari ini',
                    style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13),
                  ),
                ],
              ),
            ),

            // Daftar anggota - pakai ListView + ListTile sesuai ketentuan soal,
            // tapi dibungkus Card supaya tetap terlihat rapi & modern.
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final Color color = user['color'];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 3,
                    shadowColor: color.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(user['icon'], color: color, size: 24),
                      ),
                      title: Text(
                        user['name'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          user['role'],
                          style: TextStyle(
                            fontSize: 12.5,
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_forward_ios, size: 13, color: color),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDetailPage(
                              name: user['name'],
                              bio: user['bio'],
                              role: user['role'],
                              color: color,
                              icon: user['icon'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailPage extends StatefulWidget {
  final String name;
  final String bio;
  final String role;
  final Color color;
  final IconData icon;

  const ProfileDetailPage({
    super.key,
    required this.name,
    required this.bio,
    required this.role,
    required this.color,
    required this.icon,
  });

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  bool _isFollowing = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      // AppBar ini yang bikin tombol "Kembali" otomatis muncul
      appBar: AppBar(
        backgroundColor: widget.color,
        foregroundColor: Colors.white,
        title: const Text('Detail Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          // Layout vertikal pakai Column sesuai ketentuan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon besar sebagai foto profil, dibungkus lingkaran warna
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.12),
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.color, width: 3),
                ),
                child: Icon(widget.icon, size: 52, color: widget.color),
              ),
              const SizedBox(height: 16),

              // Text nama pengguna
              Text(
                widget.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),

              // Badge role kecil
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.role,
                  style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Container bio: latar belakang PASTEL + padding, sesuai ketentuan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.08), // pastel dari warna tema
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: widget.color.withOpacity(0.25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, size: 18, color: widget.color),
                        const SizedBox(width: 6),
                        Text(
                          'Tentang',
                          style: TextStyle(fontWeight: FontWeight.bold, color: widget.color),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(widget.bio, style: const TextStyle(fontSize: 14, height: 1.5)),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Tombol Follow / Following (Stateful)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _toggleFollow,
                  icon: Icon(_isFollowing ? Icons.check : Icons.person_add_alt_1),
                  label: Text(
                    _isFollowing ? 'Following' : 'Follow',
                    style: const TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFollowing ? Colors.grey[400] : widget.color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}