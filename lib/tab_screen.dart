import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMK Negeri 4 - Pelayanan Siswa'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Stack(
                  children: [
                    Icon(Icons.home, size: 28, color: Colors.purple), // Matching color
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.star, size: 10, color: Colors.amber), // Optional badge (if desired)
                    ),
                  ],
                ),
                text: 'Beranda',
              ),
              Tab(
                icon: Stack(
                  children: [
                    Icon(Icons.group, size: 28, color: Colors.purple), // Matching color
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.star, size: 10, color: Colors.amber),
                    ),
                  ],
                ),
                text: 'Students',
              ),
              Tab(
                icon: Stack(
                  children: [
                    Icon(Icons.person, size: 28, color: Colors.purple), // Matching color
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.star, size: 10, color: Colors.amber), // Optional badge (if desired)
                    ),
                  ],
                ),
                text: 'Profil',
              ),
            ],
            labelColor: Color.fromARGB(255, 222, 83, 229),
            unselectedLabelColor: Color.fromARGB(221, 187, 23, 168),
            indicatorColor: Color.fromARGB(255, 241, 97, 215),
          ),
        ),
        body: TabBarView(
          children: [
            BerandaTab(),
            StudentsTab(),
            ProfilTab(),
          ],
        ),
      ),
    );
  }
}

// Halaman-halaman baru
class BeritaSekolahPage extends StatelessWidget {
  // Contoh data berita sekolah
  final List<Map<String, dynamic>> beritaSekolah = [
    {
      'judul': 'Kegiatan Upacara Bendera',
      'deskripsi': 'Upacara bendera rutin yang diadakan setiap hari Senin di lapangan sekolah...',
      'gambar': 'assets/upacara_bendera.jpg',
      'tanggal': '21 Agustus 2024',
    },
    {
      'judul': 'Pelatihan Ekstrakurikuler',
      'deskripsi': 'Pelatihan untuk kegiatan ekstrakurikuler diadakan setiap Rabu di ruang olahraga...',
      'gambar': 'assets/pelatihan_ekstrakurikuler.jpg',
      'tanggal': '19 Agustus 2024',
    },
    {
      'judul': 'Kunjungan Studi ke Museum',
      'deskripsi': 'Kunjungan studi ke museum sejarah untuk kelas 10...',
      'gambar': 'assets/kunjungan_studi.jpg',
      'tanggal': '15 Agustus 2024',
    },
    // Tambahkan lebih banyak berita sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School News'),
        backgroundColor: Color.fromARGB(255, 206, 51, 178),
      ),
      body: Column(
        children: [
          // Pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cari Berita',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Daftar Berita
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: beritaSekolah.length,
              itemBuilder: (context, index) {
                final berita = beritaSekolah[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        berita['gambar'],
                        height: 180.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          berita['judul'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 115, 58, 212),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          berita['deskripsi'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Tanggal: ${berita['tanggal']}',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Aksi tombol, misalnya membuka berita lengkap
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Membuka berita lengkap: ${berita['judul']}'),
                                ),
                              );
                            },
                            child: Text('Baca Selengkapnya'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JadwalPelajaranPage extends StatelessWidget {
  // Contoh data jadwal pelajaran
  final List<Map<String, dynamic>> jadwalPelajaran = [
    {'hari': 'Senin', 'mataPelajaran': 'Matematika', 'jam': '08:00 - 09:30'},
    {'hari': 'Senin', 'mataPelajaran': 'Bahasa Indonesia', 'jam': '10:00 - 11:30'},
    {'hari': 'Selasa', 'mataPelajaran': 'Biologi', 'jam': '08:00 - 09:30'},
    {'hari': 'Selasa', 'mataPelajaran': 'Fisika', 'jam': '10:00 - 11:30'},
    {'hari': 'Rabu', 'mataPelajaran': 'Kimia', 'jam': '08:00 - 09:30'},
    {'hari': 'Rabu', 'mataPelajaran': 'Sejarah', 'jam': '10:00 - 11:30'},
    // Tambahkan data lebih banyak sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pelajaran'),
        backgroundColor: Color.fromARGB(255, 206, 51, 178),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Pelajaran Mingguan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 206, 51, 178),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: jadwalPelajaran.length,
                itemBuilder: (context, index) {
                  final item = jadwalPelajaran[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.schedule, color: Colors.deepPurple),
                      title: Text(item['mataPelajaran']),
                      subtitle: Text('Hari: ${item['hari']}\nJam: ${item['jam']}'),
                      contentPadding: EdgeInsets.all(16.0),
                      tileColor: Colors.deepPurple.shade50,
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

class KegiatanEkstrakurikulerPage extends StatelessWidget {
  // Contoh data kegiatan ekstrakurikuler
  final List<Map<String, dynamic>> kegiatanEkstrakurikuler = [
    {
      'nama': 'Paduan Suara',
      'deskripsi': 'Latihan vokal dan penampilan musik.',
      'gambar': 'assets/paduan_suara.jpg',
    },
    {
      'nama': 'Basket',
      'deskripsi': 'Latihan dan pertandingan basket.',
      'gambar': 'assets/basket.jpg',
    },
    {
      'nama': 'Seni Lukis',
      'deskripsi': 'Kelas seni lukis untuk semua usia.',
      'gambar': 'assets/seni_lukis.jpg',
    },
    {
      'nama': 'Robotika',
      'deskripsi': 'Pelatihan dalam pembuatan dan pemrograman robot.',
      'gambar': 'assets/robotika.jpg',
    },
    // Tambahkan lebih banyak data sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Ekstrakurikuler'),
        backgroundColor: Color.fromARGB(255, 206, 51, 178),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: kegiatanEkstrakurikuler.length,
          itemBuilder: (context, index) {
            final kegiatan = kegiatanEkstrakurikuler[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    kegiatan['gambar'],
                    height: 180.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      kegiatan['nama'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      kegiatan['deskripsi'],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Aksi tombol, misalnya membuka detail atau pendaftaran
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Informasi lebih lanjut tentang ${kegiatan['nama']}'),
                            ),
                          );
                        },
                        child: Text('Info Lebih Lanjut'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Aksi tombol, misalnya pendaftaran
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Pendaftaran untuk ${kegiatan['nama']}'),
                            ),
                          );
                        },
                        child: Text('Daftar'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


class PengumumanPage extends StatelessWidget {
  // Contoh data pengumuman
  final List<Map<String, dynamic>> pengumumanList = [
    {
      'judul': 'Libur Panjang Semester',
      'deskripsi': 'Libur panjang semester akan dimulai pada 1 September dan berakhir pada 15 September...',
      'gambar': 'assets/libur_panjang.jpg',
      'tanggal': '20 Agustus 2024',
    },
    {
      'judul': 'Pendaftaran Kegiatan Ekstrakurikuler',
      'deskripsi': 'Pendaftaran untuk kegiatan ekstrakurikuler semester ini dibuka dari 25 Agustus hingga 5 September...',
      'gambar': 'assets/pendaftaran_ekstrakurikuler.jpg',
      'tanggal': '18 Agustus 2024',
    },
    {
      'judul': 'Ujian Tengah Semester',
      'deskripsi': 'Jadwal ujian tengah semester akan diumumkan pada 23 Agustus. Harap memeriksa jadwal di papan pengumuman...',
      'gambar': 'assets/ujian_tengah_semester.jpg',
      'tanggal': '15 Agustus 2024',
    },
    // Tambahkan lebih banyak pengumuman sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
        backgroundColor: Color.fromARGB(255, 206, 51, 178),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Color.fromARGB(255, 233, 134, 192)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: pengumumanList.length,
            itemBuilder: (context, index) {
              final pengumuman = pengumumanList[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                        child: Image.asset(
                          pengumuman['gambar'],
                          height: 160.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          pengumuman['judul'],
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 206, 51, 178),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          pengumuman['deskripsi'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Tanggal: ${pengumuman['tanggal']}',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TugasDanUjianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas dan Ujian')),
      body: Center(child: Text('Konten Tugas dan Ujian')),
    );
  }
}

class ForumDiskusiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forum Diskusi')),
      body: Center(child: Text('Konten Forum Diskusi')),
    );
  }
}

class PengaturanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengaturan')),
      body: Center(child: Text('Konten Pengaturan')),
    );
  }
}

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bantuan')),
      body: Center(child: Text('Konten Bantuan')),
    );
  }
}

class PetaSekolahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peta Sekolah')),
      body: Center(child: Text('Konten Peta Sekolah')),
    );
  }
}

class KalenderAkademikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalender Akademik')),
      body: Center(child: Text('Konten Kalender Akademik')),
    );
  }
}

class KontakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kontak')),
      body: Center(child: Text('Konten Kontak')),
    );
  }
}

class InfoSekolahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Sekolah')),
      body: Center(child: Text('Konten Info Sekolah')),
    );
  }
}

// Widget utama
class BerandaTab extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.school_outlined, 'label': 'Berita Sekolah', 'page': BeritaSekolahPage()},
    {'icon': Icons.calendar_today_outlined, 'label': 'Jadwal Pelajaran', 'page': JadwalPelajaranPage()},
    {'icon': Icons.star_border_outlined, 'label': 'Kegiatan Ekstrakurikuler', 'page': KegiatanEkstrakurikulerPage()},
    {'icon': Icons.notifications_outlined, 'label': 'Pengumuman', 'page': PengumumanPage()},
    {'icon': Icons.assignment_outlined, 'label': 'Tugas dan Ujian', 'page': TugasDanUjianPage()},
    {'icon': Icons.chat_bubble_outline, 'label': 'Forum Diskusi', 'page': ForumDiskusiPage()},
    {'icon': Icons.settings_outlined, 'label': 'Pengaturan', 'page': PengaturanPage()},
    {'icon': Icons.help_outline, 'label': 'Bantuan', 'page': BantuanPage()},
    {'icon': Icons.location_on_outlined, 'label': 'Peta Sekolah', 'page': PetaSekolahPage()},
    {'icon': Icons.event_note_outlined, 'label': 'Kalender Akademik', 'page': KalenderAkademikPage()},
    {'icon': Icons.mail_outline, 'label': 'Kontak', 'page': KontakPage()},
    {'icon': Icons.info_outline, 'label': 'Info Sekolah', 'page': InfoSekolahPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item['page']),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade100, Colors.purple.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 197, 56, 157).withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icon'],
                    size: 50.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: BerandaTab())));
}

class StudentsTab extends StatelessWidget {
  Future<List<Student>> fetchStudents() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((student) => Student.fromJson(student)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: FutureBuilder<List<Student>>(
        future: fetchStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final students = snapshot.data!;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 197, 56, 157), Colors.pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Icon(Icons.person, color: Color.fromARGB(255, 229, 52, 191)),
                  ),
                  title: Text(student.firstName),
                  subtitle: Text(student.email),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class ProfilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'pratiartnw',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Email: pratiaretnowidiawati1@gmail.com',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 242, 132, 205)),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Biodata',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nama Lengkap'),
            subtitle: Text('Pratia Retno Widiawati'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Tanggal Lahir'),
            subtitle: Text('16 Juli 2007'),
          ),
        ],
      ),
    );
  }
}

class Student {
  final String firstName;
  final String email;
  Student({required this.firstName, required this.email});
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['first_name'],
      email: json['email'],
    );
  }
}