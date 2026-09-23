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
// Screen 1: StatelessWidget murni (sesuai ketentuan, tanpa search)
// Screen 2: StatefulWidget, detail lengkap (stats, skill, kontak)
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
        'followers': 128,
        'projects': 24,
        'experience': '2 thn',
        'rating': 4.8,
        'email': 'budi.santoso@email.com',
        'phone': '0812-3456-7890',
        'skills': ['Flutter', 'Dart', 'Firebase', 'REST API'],
      },
      {
        'name': 'Siti Aminah',
        'bio': 'UI/UX Designer, hobi bikin mockup Figma dan riset pengalaman pengguna.',
        'role': 'UI/UX Designer',
        'color': const Color(0xFFEC4899),
        'icon': Icons.brush,
        'followers': 94,
        'projects': 37,
        'experience': '3 thn',
        'rating': 4.9,
        'email': 'siti.aminah@email.com',
        'phone': '0813-2233-4455',
        'skills': ['Figma', 'Wireframing', 'User Research', 'Prototyping'],
      },
      {
        'name': 'Andi Wijaya',
        'bio': 'Backend Developer, jago urusan database dan optimasi server.',
        'role': 'Backend Developer',
        'color': const Color(0xFF14B8A6),
        'icon': Icons.storage,
        'followers': 210,
        'projects': 45,
        'experience': '4 thn',
        'rating': 4.7,
        'email': 'andi.wijaya@email.com',
        'phone': '0814-9988-7766',
        'skills': ['Node.js', 'MySQL', 'Docker', 'AWS'],
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
                        'Anggota 👋',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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

            // Caption section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 18, 20, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Daftar Anggota', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            // Daftar anggota - ListView + ListTile
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final Color color = user['color'];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 3,
                    shadowColor: color.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(user['icon'], color: color, size: 24),
                      ),
                      title: Text(user['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          user['role'],
                          style: TextStyle(fontSize: 12.5, color: color, fontWeight: FontWeight.w600),
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                        child: Icon(Icons.arrow_forward_ios, size: 13, color: color),
                      ),
                      onTap: () {
                        // Stack Navigation -> pindah ke Screen 2
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 350),
                            pageBuilder: (context, animation, secondaryAnimation) => ProfileDetailPage(
                              name: user['name'],
                              bio: user['bio'],
                              role: user['role'],
                              color: color,
                              icon: user['icon'],
                              initialFollowers: user['followers'],
                              projects: user['projects'],
                              experience: user['experience'],
                              rating: user['rating'],
                              email: user['email'],
                              phone: user['phone'],
                              skills: List<String>.from(user['skills']),
                            ),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              final offsetAnimation = Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
                              return SlideTransition(position: offsetAnimation, child: child);
                            },
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
  final int initialFollowers;
  final int projects;
  final String experience;
  final double rating;
  final String email;
  final String phone;
  final List<String> skills;

  const ProfileDetailPage({
    super.key,
    required this.name,
    required this.bio,
    required this.role,
    required this.color,
    required this.icon,
    required this.initialFollowers,
    required this.projects,
    required this.experience,
    required this.rating,
    required this.email,
    required this.phone,
    required this.skills,
  });

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  bool _isFollowing = false;
  late int _followersCount;

  @override
  void initState() {
    super.initState();
    _followersCount = widget.initialFollowers;
  }

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followersCount += _isFollowing ? 1 : -1;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFollowing ? 'Kamu mulai mengikuti ${widget.name}' : 'Kamu berhenti mengikuti ${widget.name}',
        ),
        backgroundColor: _isFollowing ? widget.color : Colors.grey[700],
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      // AppBar -> tombol "Kembali" otomatis muncul
      appBar: AppBar(
        backgroundColor: widget.color,
        foregroundColor: Colors.white,
        title: const Text('Detail Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          // Layout vertikal pakai Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon besar sebagai foto profil
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
              Text(widget.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.role,
                  style: TextStyle(color: widget.color, fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${widget.rating}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 4),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      '· $_followersCount followers',
                      key: ValueKey<int>(_followersCount),
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Stats row: proyek, pengalaman, rating
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: widget.color.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(icon: Icons.work_outline, value: '${widget.projects}', label: 'Proyek', color: widget.color),
                    Container(width: 1, height: 36, color: Colors.grey[200]),
                    _StatItem(icon: Icons.access_time, value: widget.experience, label: 'Pengalaman', color: widget.color),
                    Container(width: 1, height: 36, color: Colors.grey[200]),
                    _StatItem(icon: Icons.star_border, value: '${widget.rating}', label: 'Rating', color: widget.color),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Container bio: latar belakang pastel + padding
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.08),
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
                        Text('Tentang', style: TextStyle(fontWeight: FontWeight.bold, color: widget.color)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(widget.bio, style: const TextStyle(fontSize: 14, height: 1.5)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Skill tags
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Keahlian', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey[800])),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.skills.map((skill) {
                  return Chip(
                    label: Text(skill, style: TextStyle(fontSize: 12.5, color: widget.color, fontWeight: FontWeight.w600)),
                    backgroundColor: widget.color.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: widget.color.withOpacity(0.3)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Kontak
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: widget.color.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kontak', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey[800])),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.email_outlined, size: 18, color: widget.color),
                        const SizedBox(width: 10),
                        Expanded(child: Text(widget.email, style: const TextStyle(fontSize: 13.5))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: 18, color: widget.color),
                        const SizedBox(width: 10),
                        Expanded(child: Text(widget.phone, style: const TextStyle(fontSize: 13.5))),
                      ],
                    ),
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
                  label: Text(_isFollowing ? 'Following' : 'Follow', style: const TextStyle(fontSize: 15)),
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

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
      ],
    );
  }
}