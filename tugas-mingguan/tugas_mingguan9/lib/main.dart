import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'local_notification.dart';
import 'maps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

            ElevatedButton(
              onPressed: () async {
                NotificationHelper.payload.value = "";

                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                  Random().nextInt(99),
                  "Judul Local Notification",
                  "Percobaan untuk menampilkan local notification",
                  payload: jsonEncode({"data": "tests"}),
                  NotificationHelper.notificationDetails,
                );

                // Navigasi ke halaman kedua (MapsPage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GMapsPage()),
                );
              },
              child: Text('Go to Maps Page'),
            ),
          ],
        ),
      ),
    );
  }
}
