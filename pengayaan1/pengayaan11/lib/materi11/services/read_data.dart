import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pengayaan11/materi11/services/detail_read.dart';
import 'package:pengayaan11/materi11/model/list_album_model.dart';
import 'package:pengayaan11/materi11/services/materi_services.dart';

Future<List<Post>> postFuture = MateriServices.getPosts();

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({super.key});

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  late Future<Post> futureAlbum;

  @override
  void initState() {
    super.initState();
    postFuture = postFuture;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'fetach list data',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('fetch list data example'),
            ),
            body: Center(
              child: FutureBuilder<List<Post>>(
                future: postFuture,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final posts = snapshot.data!;
                    return buildPosts(posts);
                  } else {
                    return const Text("No data available");
                  }
                },
              ),
            )));
  }

  Widget buildPosts(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return InkWell(
          onTap: () {
            print(post.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailReadDataPage(
                          id: post.id,
                        )));
          },
          child: Container(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.network(
                        "https://sanbercode.com/assets/img/logo@2x.jpg")),
                const SizedBox(width: 10),
                Expanded(flex: 3, child: Text(post.title!)),
              ],
            ),
          ),
        );
      },
    );
  }
}
