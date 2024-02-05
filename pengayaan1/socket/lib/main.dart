import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:socket/socket_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: SocketPage(
        channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),
      ),
    );
  }
}
