import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key, required this.title});
  final String title;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null? const Text('no image selected.') : Image.file(File(_image!.path)),
            MaterialButton(
              color:Colors.blue,
               onPressed: getImage,
               child: const Text("Pick image from gallery",
               style: TextStyle(
                color: Colors.white70, fontWeight: FontWeight.bold,))),
                ElevatedButton(
                  onPressed: () {
                    print (_image?.path);
                  },
                   child:const Text("Hasil dari device"),
                )
          ],)
      )
    );
  }

  Future <void> getImage () async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose () {
    super.dispose();
  }
}
