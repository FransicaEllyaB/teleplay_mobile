## Teleplay

<details>
<summary>Tugas 7</summary>
    
## Proses Pengerjaan Tugas
    
1. Membuat proyek flutter baru dengan nama <b>Teleplay</b>

```
flutter create teleplay
```

2. Membuat file baru bernama `menu.dart`

3. Mengisi file `menu.dart` dengan widget stateless bernama `MyHomePage`.

```
class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ... // jangan copy titik-titik ini!
        );
    }
}
```

4. Import file `menu.dart` ke file `main.dart`

```
import 'package:teleplay_mobile/menu.dart';
```

5. Membuat class widget bernama `ItemHomePage` untuk membuat object item pada file `menu.dart` denga warna, nama, dan color yang yang memungkinkan Anda membuat objek dengan setiap atribut yang berkorelasi untuk tiap item.

```
class ItemHomePage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomePage(this.name, this.icon, this.color);
}
```

6. Membuat list of items yang ingin dibuat pada file `menu.dart`.

7. Membuat tiga tombol sederhana dengan ikon dan teks.
```
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
```

8. Snackbar dengan tulisan 
*  "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
* "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
* "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

```
child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
)
```
## Menjawab Pertanyaan
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
<table>
    <tr>
        <th></th>
        <th>Stateless Widget</th>
        <th>Statefull Widget</th>
    </tr>
    <tr>
        <td>Definisi</td>
        <td>Widget yang tidak dapat berubah (widget statis)</td>
        <td>Widget yang mengubah propertinya selama run time (widget dinamis)</td>
    </tr>
    <tr>
        <td>Ketergantungan pada data atau perubahan perilaku apa pun</td>
        <td>Tidak bergantung pada perubahan data atau perubahan perilaku apa pun</td>
        <td>Diperbarui selama runtime berdasarkan tindakan pengguna atau perubahan data</td>
    </tr>
    <tr>
        <td>Status</td>
        <td>Tidak memiliki status hanya terrender sekali dan tidak akan memperbarui dirinya sendiri, tetapi hanya akan diperbarui saat data eksternal berubah</td>
        <td>Memiliki status internal dan dapat dirender ulang jika data masukan berubah atau jika status widget berubah</td>
    </tr>
    <tr>
        <td>Contoh Implementasi</td>
        <td>
            <pre>
                <code>
        class MyStatelessWidget extends StatelessWidget {
        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return Container(
            child: Text('This is a Stateless Widget'),
            );
        }
        }
                </code>
            </pre>
        </td>
        <td>
            <pre>
                <code>
        class MyStatefulWidget extends StatefulWidget {
        MyStatefulWidget({Key? key}) : super(key: key);
        @override
        _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
        }
                </code>
            </pre>
        </td>
    </tr>
</table>

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

* Scaffold: Widget ini sebagi struktur dasar untuk halaman, menyediakan kerangka untuk AppBar dan body.
* AppBar: widget ini untuk menampilkan judul di bagian atas halaman.
* SingleChildScrollView: widget ini untuk memungkinkan halaman untuk discroll ketika konten meluap di layar.
* Padding: widget ini untuk memberikan ruang di sekitar widget.
* Column: widget ini untuk menyusun widget secara vertikal.
* Row: widget ini untuk menyusun widget secara horizontal.
* SizedBox: widget ini untuk memberikan jarak atau ruang kosong vertikal.
* Center: widget ini untuk menempatkan widget di tengah-tengah.
* GridView.count: widget ini untuk membuat tata letak grid dengan jumlah kolom tertentu.
* Card: widget ini untuk menyediakan konten yang flexibel dan dapat diperluas, serta sebagai tempat untuk menampilkan berbagai informasi.
* Container: widget serbaguna untuk tata letak, padding, dan ukuran.
* Text: widget ini untuk menampilkan teks.
* Material: widget ini untuk memberikan tampilan material pada widget.
* InkWell: widget ini untuk menambahkan efek interaktif ketika widget ditekan.
* Icon: widget ini untuk menampilkan ikon dari Icons library.
* SnackBar: widget ini untuk memberikan notifikasi sementara di bagian bawah halaman.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
   
setState() berguana untuk memberi tahu framework bahwa ada objek dengan internal state yang berubah sehingga memerlukan pembaruan tampilan (UI). Fungsi ini menyebabkan framework untuk build state objek. Semua variabel yang merupakan bagian dari State class dari widget yang memanggil setState() dapat terdampak. Contohnya variabel yang mengubah data tampilan dan variabel yang mengatur kondisi UI.

5. Jelaskan perbedaan antara const dengan final.
   
* final digunakan ketika variabel hanya diinisialisasi sekali tetapi nilainya baru diketahui saat runtime.
* const keyword untuk menetapkan variabel konstan sejak waktu kompilasi. Penggunaan const pada suatu objek, menjadikan seluruh status mendalam objek benar-benar tetap pada waktu kompilasi dan objek dengan status ini akan dianggap beku dan sepenuhnya tidak dapat diubah. Objek yang dibuat menggunakan const bersifat immutable.

</details>
