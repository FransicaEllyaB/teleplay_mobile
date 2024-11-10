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
```
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama",
      labelText: "Nama",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _nama = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Nama tidak boleh kosong!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Banyak Produk",
      labelText: "Banyak Produk",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _amount = int.tryParse(value!) ?? 0;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Banyak Produk tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Banyak Produk harus berupa angka!";
      }
      if (int.tryParse(value)! < 0) {
        return "Harga harus valid";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Harga",
      labelText: "Harga",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _price = int.tryParse(value!) ?? 0;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
      }
      if (int.tryParse(value)! < 0) {
        return "Harga harus valid";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Image URL",
      labelText: "Enter a valid image URL",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _imageUrl = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Image URL tidak boleh kosong!";
      }
      if (!Uri.tryParse(value)!.hasAbsolutePath) {
        return "Please enter a valid URL";
      }
      return null;
    },
  ),
),
// Input Durasi
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Duration",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Jam
          DropdownButton<int>(
            value: _hours,
            onChanged: (value) {
              setState(() {
                _hours = value!;
              });
            },
            items: List.generate(24, (index) => index)
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value h'),
              );
            }).toList(),
          ),
          // Menit
          DropdownButton<int>(
            value: _minutes,
            onChanged: (value) {
              setState(() {
                _minutes = value!;
              });
            },
            items: List.generate(60, (index) => index)
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value m'),
              );
            }).toList(),
          ),
          // Detik
          DropdownButton<int>(
            value: _seconds,
            onChanged: (value) {
              setState(() {
                _seconds = value!;
              });
            },
            items: List.generate(60, (index) => index)
                .map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value s'),
              );
            }).toList(),
          ),
        ],
      ),
      if (_durationError != null)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _durationError!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
    ],
  ),
),
```

```
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text('Video berhasil tersimpan'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Display Image
            if (_imageUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(16.0),
                    child: Image.network(
                      _imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error,
                          stackTrace) {
                        return const Text(
                          "Failed to load image.",
                          style: TextStyle(
                              color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
              ),
            Text('Nama: $_nama'),
            Text('Amount: $_amount'),
            Text('Harga: $_price'),
            Text('Deskripsi: $_description'),
            Text(
              'Durasi: ${duration.inHours}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
            _formKey.currentState!.reset();
            setState(() {
              _hours = 0;
              _minutes = 0;
              _seconds = 0;
            });
          },
        ),
      ],
    );
  },
);
```

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
Const digunakan dalam flutter untuk menghindari pembuatan widget yang tidak penting, untuk meningkatkan performance dari widget tree, dan untuk memastikan immutability. Const dipakai ketika value dari suatu variabel diketahui ketika `compile time` dan tidak pernah berubah. `Const` sebaiknya tidak digunakan untuk variabel yang valuenya dapat berubah.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini! <br>
Row adalah widget yang dapat digunakan untuk menempatkan widget-widget lainnya secara horizontal, sedangkan Column adalah widget yang dapat digunakan untuk menempatkan widget-widget lainnya secara vertikal. Perbedaan antara Row dan Column dalam flutter adalah tata letak yang horizontal/vertikal dalam sebuah aplikasi Flutter.

Contoh implementasinya:
```
Row(
  children:[
    Text('Element 1'),
    Text('Element 2'),
    Text('Element 3'),
  ]
)
```
```
Column(
  children:[
    Text('Element 1'),
    Text('Element 2'),
    Text('Element 3'),
  ]
)

```

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan! <br>
Elemen input pada halaman form yang telah saya buat adalah TextFormField dan DropDown. TextFormField untuk memasukkan teks seperti nama produk, jumlah produk, harga, deskripsi, dan URL gambar. Selain itu, DropDown untuk memilih durasi dalam jam, menit, dan detik. Ada elemen input flutter yang tidak saya gunakan, seperti CheckBox, Radio, Slider, dan Switch. 
* Checkbox: Bisa digunakan untuk input tipe boolean, seperti menandai apakah produk sedang promosi atau tidak.
* Radio: Cocok untuk memilih salah satu opsi dari beberapa pilihan yang tetap, misalnya kategori produk.
* Slider: Untuk input nilai dalam rentang tertentu, bisa digunakan untuk memilih rating produk.
* Switch: Cocok untuk input on/off, bisa digunakan untuk fitur seperti "produk tersedia/tidak tersedia".

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat? <br>
Agar konsisten, saya menggunakan ThemeData di MaterialApp dan menentukan ColorScheme dan TextTheme. Berikut kode untuk peng-implementasian tema pada aplikasi yang saya buat.

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