import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:teleplay_mobile/models/video_entry.dart';
import 'package:teleplay_mobile/widgets/left_drawer.dart';

class VideoEntryPage extends StatefulWidget {
  const VideoEntryPage({super.key});

  @override
  State<VideoEntryPage> createState() => _VideoEntryPageState();
}

class _VideoEntryPageState extends State<VideoEntryPage> {
  Future<List<MoodEntry>> fetchVideo(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object VideoEntry
    List<MoodEntry> listVideo = [];
    for (var d in data) {
      if (d != null) {
        listVideo.add(MoodEntry.fromJson(d));
      }
    }
    return listVideo;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchVideo(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data video pada teleplay nih.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.name}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.duration}"),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 200.0, // Tentukan lebar
                        height: 200.0, // Tentukan tinggi
                        child: Image.network(
                          "${snapshot.data![index].fields.videoThumbnail}",
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                "${snapshot.data![index].fields.videoThumbnail}",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
