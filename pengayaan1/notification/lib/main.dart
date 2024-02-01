import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notification/notification_helper.dart';

void main() async {
  ////Tambahkan [EnsureInitializes] agar fungsi di bawahnya
  ///dijalankan saat flutter app benar-benar ter-inisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  ///inisialisasi local notification
  await NotificationHelper().initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Local Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListenableBuilder(
                listenable: NotificationHelper.payload,
                builder: (context, child) {
                  return Text(
                      "Local Notification Payload: \n\n${NotificationHelper.payload.value}");
                }),

            ////kirim notifikasi
            ElevatedButton(
                onPressed: () async {
                  ///reset payload value
                  NotificationHelper.payload.value = "";

                  ///kirim notifikasi
                  await NotificationHelper.flutterLocalNotificationsPlugin.show(
                      Random().nextInt(99),
                      "Judul Local Notification",
                      "Percobaan untuk menampilkan local notification",
                      payload: jsonEncode({"data": "tests"}),
                      NotificationHelper.notificationDetails);
                },
                child: Text('Kirim Notifikasi'))
          ],
        ),
      ),
    );
  }
}
