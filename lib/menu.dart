import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  // Identitas Kartu
  final String npm = '2306152286'; // NPM
  final String name = 'Fransisca Ellya Bunaren'; // Nama
  final String className = 'PBP F'; // Kelas

  // Button Pemilihan
  final List<ItemHomePage> items = [
    ItemHomePage(
        "Lihat Daftar Produk", Icons.video_collection, const Color(0xFF007AAC)),
    ItemHomePage("Tambah Produk", Icons.add, const Color(0xFF0BA484)),
    ItemHomePage("Logout", Icons.logout, const Color(0xFFef4444)),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
        // AppBar adalah bagian atas halaman yang menampilkan judul.
        appBar: AppBar(
          title: const Text(
            'Teleplay',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1f2937),
          foregroundColor: Colors.white,
        ),

        // Agar responsif di google
        body: SingleChildScrollView(
          //halaman dengan padding di sekelilingnya.
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Menyusun widget secara vertikal dalam sebuah kolom.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row untuk menampilkan 3 InfoCard secara horizontal.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: name),
                    InfoCard(title: 'Class', content: className),
                  ],
                ),

                // Memberikan jarak vertikal 16 unit.
                const SizedBox(height: 16.0),

                // Menempatkan widget berikutnya di tengah halaman.
                Center(
                  child: Column(
                    // Menyusun teks dan grid item secara vertikal.

                    children: [
                      // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Welcome to Teleplay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),

                      // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                      GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        // Agar grid menyesuaikan tinggi kontennya.
                        shrinkWrap: true,

                        // Menampilkan ItemCard untuk setiap item dalam list items.
                        children: items.map((ItemHomePage item) {
                          return ItemCard(item);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width /
            3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomePage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomePage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomePage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
