import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class SocketHelper {
  socket_io.Socket? socket;

  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void connectAndListen() {
    socket?.close();

    socket = socket_io.io('http:localhost:3001',
        socket_io.OptionBuilder().setTransports(['website']).build());

    socket?.onConnect((_) => debugPrint('socket connected'));

    socket?.on('msg', (data) {
      addResponse(data);
    });

    socket?.onDisconnect((_) => debugPrint('disconnect'));
  }

  void callMsgEvent() {
    socket?.emit('msg', "Data dari event ${Random().nextInt(999)}");
  }

  void Dispose() {
    socket?.close();
    _socketResponse.close();
  }
}

class _MateriSocketIOState extends State<_MateriSocketIOState> {
  final socket = SocketHelper();

  @override
  void initState() {
    super.initState();
    socket.connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'tugas mingguan 10',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<String>(
                stream: socket.getResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("Data dari socket: ${snapshot.data}");
                  } else {
                    return const Text("menunggu data dari socket");
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                socket.callMsgEvent();
              },
              child: const Text("memanggil event"),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    socket.Dispose();
    super.dispose();
  }
}


