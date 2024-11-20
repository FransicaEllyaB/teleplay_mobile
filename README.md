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

4. Jelaskan perbedaan antara const dengan final.
   
* final digunakan ketika variabel hanya diinisialisasi sekali tetapi nilainya baru diketahui saat runtime.
* const keyword untuk menetapkan variabel konstan sejak waktu kompilasi. Penggunaan const pada suatu objek, menjadikan seluruh status mendalam objek benar-benar tetap pada waktu kompilasi dan objek dengan status ini akan dianggap beku dan sepenuhnya tidak dapat diubah. Objek yang dibuat menggunakan const bersifat immutable.

</details>

<details>
<summary>Tugas 8</summary>

## Proses Pengerjaan Tugas
1. Membuat `left_drawer.dart` dengan 2 opsi `halaman utama` dan  `tambah produk`

2. Membuat `videoentry_form.dart` dengan validasi dari setiap input nama, amount, description, duration, dan image serta menampilkan data yang dikirim dengan `show_dialog()` setelah ditekan button `save`

3. Mengarahkan pengguna ke halaman form pada `Tambah Produk` button
```
if (item.name == "Tambah Produk") {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const VideoEntryFormPage()));
}
```
4. Melakukan refaktorisasi dengan memindahkan file `left_drawer.dart` dan `video_card.dart` ke direktori `widgets` serta `menu.dart` dan `videoentry_form.dart` ke direktori `screens`

## Menjawab Pertanyaan
1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan? <br>
Const digunakan dalam flutter untuk menghindari pembuatan widget berulang, untuk meningkatkan performance dari widget tree, dan untuk memastikan immutability. <br>
Keuntungan menggunakan `const`:
* Optimalisasi performa: Dengan const, Flutter tidak perlu membuat ulang widget setiap kali terjadi rebuild karena widget tersebut dianggap tidak berubah.
* Pengurangan penggunaan memori: Objek const disimpan di memori yang di-cache dan tidak perlu dibuat ulang. <br><br>
Const dipakai ketika value dari suatu variabel diketahui ketika `compile time` dan tidak pernah berubah. `Const` sebaiknya tidak digunakan untuk variabel yang valuenya dapat berubah.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini! <br>
Row adalah widget yang dapat mengatur widget anak secara horizontal (dari kiri ke kanan), sedangkan Column adalah widge yang dapat mengatur widget anak secara vertikal (dari atas ke bawah). Perbandingan penggunaan adalah Row dapat digunakan untuk menempatkan widget-widget lainnya secara horizontal dan Column dapat digunakan untuk menempatkan widget-widget lainnya secara vertikal. Perbedaan antara Row dan Column dalam flutter adalah tata letak yang horizontal/vertikal dalam sebuah aplikasi Flutter.

Contoh implementasinya:
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```
```
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

```

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan! <br>
Elemen input pada halaman form yang telah saya buat adalah TextFormField dan DropDown. TextFormField untuk memasukkan teks seperti nama produk, jumlah produk, harga, deskripsi, dan URL gambar. Selain itu, DropDown untuk memilih durasi dalam jam, menit, dan detik. Ada elemen input flutter yang tidak saya gunakan, seperti CheckBox, Radio, Slider, dan Switch. 
* Checkbox: Bisa digunakan untuk input tipe boolean, seperti menandai apakah produk sedang promosi atau tidak.
* Radio: Cocok untuk memilih salah satu opsi dari beberapa pilihan yang tetap, misalnya kategori produk.
* Slider: Untuk input nilai dalam rentang tertentu, bisa digunakan untuk memilih rating produk.
* Switch: Cocok untuk input on/off, bisa digunakan untuk fitur seperti "produk tersedia/tidak tersedia".

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat? <br>
Agar konsisten, saya menggunakan ThemeData di MaterialApp dan menentukan ColorScheme dan TextTheme. Berikut kode untuk mengimplementasian tema pada aplikasi yang saya buat.

```
theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(secondary: Colors.indigo[400]),
        useMaterial3: true,
      ),
```

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter? <br>
Pada aplikasi ini, penerapan yang saya gunakan untuk halaman pada flutter adalah navigator dan route. Beberapa penggunaan navigator, yaitu 
* `push()`
Method `push()` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator.
* `pop()`
Method `pop()` menghapus route yang sedang ditampilkan kepada pengguna (atau dalam kata lain, route yang berada pada paling atas stack) dari stack route yang dikelola oleh Navigator.
* `pushReplacement()`
Method `pushReplacement()` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. 

</details>

<details>
<summary>Tugas 9</summary>

## Proses Pengerjaan Tugas
1. Menambahkan depedensi yang dibutuhkan, seperti 
```
flutter pub add provider
flutter pub add pbp_django_auth
flutter pub add http
```

2. Menambahkan `CookieRequest` library ke semua child widgets dengan `Provider`.

3. Membuat `login.dart` pada subdirektori `screens` untuk menampilkan form login.

4. Mengarahkan `main.dart` ke `login.dart`

5. Membuat `video_entry.dart` pada models

6. Penerapan Fetch data dari django untuk ditampilkan ke Flutter

7. Membuat `list_videoentry.dart` ke subdirektori `screens` untuk menampilkan list seluruh produk dengan masing masing produk memiliki name, price, descriprtion, imageURL, dan durasi.

8. Melakukan perubahan pada subdirektori `screens` untuk mengubah input yang diterima ke dalam JSON kemudian mengirimnya ke server sehingga dapat dilakukan fetch.

9. Melakukan perubahan pada `menu.dart` agar tombol logout dapat berfungsi untuk ke luar halaman, yaitu halaman login.

10. Seorang user hanya dapat berinteraksi dengan produk yang terasosiaso dengan pengguna yang login.

## Menjawab Pertanyaan
1. <b>Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?</b><br>

Kita perlu membuat model agar <br>
-> Struktur data yang konsisten
Dengan model membantu memastikan bawa struktur data yang diterima atau dikirim ke API selalu sesuai yang diharapkan. <br>
-> Validasi dan keamanan <br>
Model membantu memastikan bahwa atribut tertentu dari JSON yang diterima atau dikirim sehingga menimalkan risiko kebocoran data sensitif. <br>
-> Kemudahan pemrograman <br>
Model membuat kode lebih terstruktur dan dan mudah dibaca. <br>
-> Pemetaan data secara otomatis <br>
Model menyebabkan JSON dapat langsung memetakan JSON ;angsung ke objek secara otomatis <br><br>

Jika model tidak ada, tidak selalu membuat error, tetapi tidak selalu tergantung dengan <br>
-> Ukuran dan kompleksitas data JSON <br>
Jika ukuran JSON sangat besar, mengelola data secara manual dapat menyebabkan rentan terhadap kesalahan <br>
-> Error Parsing atau Access <br>
Tanpa modek, pengaksesan data dapat menyebabkan crash, seperti KeyError di Python atau NullPointerException. <br>
-> Perubahan API <br>
Jika struktut JSON berubah di API, kode akan sulit menyesuaikan dengan perubahan sehingga dibutuhkan model. <br><br>

2. <b>Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini</b><br>

Fungsi dari library http adalah sebagai pengelola komunikasi antara aplikasi flutter dengan server, library ini untuk menyediakan metode untuk mengirimkan sebuah request ke server dan menerima respon dari server yang umumnya berformat JSON. Fungsi dari library http adalah <br>

** Melakukan HTTP Request <br>
Library http memungkinkan aplikasi untuk mengirim berbagai jenis request HTTP seperti GET (mengambil data dari server), POST/PUT (mengirimkan data ke server), dan DELETE (menghapus data dari server). <br>

** Mengirimkan data ke server. <br>
Library http mendukung pengiriman data dalam berbagai format. Data dikirim bersama body request ke server, sering kali dalam metode POST atau PUT. <br>

** Menerima dan memproses respon server <br>
Library http memungkinkan untuk membaca kode status HTTP, mengakses data respon, dan memproses respon untuk ditampilkan dalam aplikasi. <br>

** Error Handling <br>
Library http dapat menangani error, seperti timout, kegagalan jarinagan, dan respon tidak sesuai format. <br>

** Menyediakan Header dan Authentication <br>
Library http mendukung penambahan header pada setiap request untuk keperluan otentikasi atau kebutuhan spesifik lainnya, seperti token API, tipe konten, atau pengaturan khusus lainnya. <br>

3. <b>  Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</b> <br>

CookieRequest adalah suatu mekanisme atau kelas yang bertugas mengelola sesi autentikasi pengguna melalui cookie, baik untuk pengiriman maupun penerimaan cookie saat berkomunikasi dengan server. Fungsinya meliputi:

* Mengelola Sesi Pengguna
CookieRequest memungkinkan aplikasi untuk menyimpan informasi sesi pengguna menggunakan cookie yang dikirim oleh server, seperti session ID atau token autentikasi. Hal ini memastikan bahwa pengguna tetap terautentikasi selama sesi berlangsung tanpa perlu login berulang kali.

* Otomasi Manajemen Cookie
CookieRequest mempermudah pengelolaan cookie di aplikasi Flutter tanpa perlu mengelola cookie secara manual.

* Mendukung Otentikasi Stateful
Dalam sistem yang menggunakan cookie sebagai mekanisme autentikasi (stateful authentication), server menyimpan status pengguna berdasarkan session ID yang terdapat pada cookie. CookieRequest memastikan bahwa cookie ini selalu dikirim dalam setiap permintaan yang membutuhkan autentikasi.

Instance CookieRequest perlu dibagikan ke semua komponen karena Konsistensi Sesi Pengguna, Konsistensi Sesi Pengguna, Pengelolaan Cookie Terpusat Dengan instance yang dibagikan, Efisiensi, dan Kemudahan Integrasi dengan Backend. 

4. <b> Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.</b>
* Input Data di Flutter
Pengguna memasukkan data melalui antarmuka (form atau widget) di aplikasi Flutter. Komponen utama yang dipakai adalah TextField atau TextFormField untuk input teks. Tombol (Button) untuk mengirimkan data.
Pengolahan Input yang digunakan adalah data input pengguna diambil melalui pengendali (controller) seperti TextEditingController dan data yang diambil diverifikasi (validasi input) sebelum dikirim ke backend.
* Validasi Data Input Sebelum data dikirimkan, biasanya dilakukan validasi untuk memastikan input sesuai dengan persyaratan.
* Serialisasi Data Data yang diambil dari input diubah menjadi format yang dapat dikirim ke server.
* Pengiriman Data ke Backend
Flutter mengirimkan data ke backend melalui HTTP Request, biasanya menggunakan metode POST atau GET. 
Protokol yang Digunakan, adalah HTTP/HTTPS (biasanya HTTPS untuk keamanan). Lalu, library HTTP di Flutter http digunakan untuk mengirimkan data ke server.
* Pemrosesan Data di Server Setelah data diterima di server:
* Parsing dan Menampilkan Respons di Flutter Setelah menerima respons, aplikasi Flutter
* Handle Error yang dilakukan agar aplikasi tidak crash.
* Pengguanaan statte management untuk uodate UI. Dalam aplikasi yang kompleks, state management seperti Provider atau Riverpod digunakan untuk menyimpan data yang diterima dari server, lalu memperbarui UI secara otomatis.

5. <b>Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</b>
(1) Register:
Pengguna mengisi data di Flutter → Django memvalidasi dan menyimpan data pengguna → Akun terdaftar.
(2) Login:
Flutter mengirimkan kredensial → Django memvalidasi → Django mengirimkan token ke Flutter → Token disimpan.
(3) Akses Menu:
Token digunakan pada setiap permintaan → Django memverifikasi token → Data dikirimkan ke Flutter.
(4) Logout:
Flutter menghapus token lokal → Django menghapus token di server.
Mekanisme ini memastikan keamanan autentikasi dan kenyamanan pengguna selama menggunakan aplikasi.

</details>
