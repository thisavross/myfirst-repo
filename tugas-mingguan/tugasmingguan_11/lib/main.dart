import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final List<CameraDescription> cameras = await availableCameras();
      final firstCamera = cameras.firstOrNull;
      if (firstCamera != null) {
        controller = CameraController(firstCamera, ResolutionPreset.max);
        await controller?.initialize();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "tugas mingguan camera",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: controller != null
              ? CameraPreview(controller!)
              : Container(color: Colors.black),
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
