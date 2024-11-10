import 'package:flutter/material.dart';
import 'package:teleplay_mobile/widgets/left_drawer.dart';

class VideoEntryFormPage extends StatefulWidget {
  const VideoEntryFormPage({super.key});

  @override
  State<VideoEntryFormPage> createState() => _VideoEntryFormPageState();
}

class _VideoEntryFormPageState extends State<VideoEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  String _imageUrl = "";
  String? _durationError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Form Tambah Produk'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          if (_hours == 0 && _minutes == 0 && _seconds == 0) {
                            _durationError = "Pilih Durasi yang diinginkan";
                          } else {
                            _durationError = null;
                            Duration duration = Duration(
                              hours: _hours,
                              minutes: _minutes,
                              seconds: _seconds,
                            );

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
                          }
                        });
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
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
