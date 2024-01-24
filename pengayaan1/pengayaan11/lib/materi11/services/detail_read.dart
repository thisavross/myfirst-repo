import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pengayaan11/materi11/model/album_model.dart';
import 'package:pengayaan11/materi11/services/materi_services.dart';
import 'package:pengayaan11/materi11/services/read_data.dart';

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({super.key, this.id});
  final id;

  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPageState();
}

class _DetailReadDataPageState extends State<DetailReadDataPage> {
  late Future<Album> futureAlbum = MateriServices.fetchAlbum(widget.id);
  @override
  void initState() {
    super.initState();
    futureAlbum = futureAlbum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fetch data example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch data example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
