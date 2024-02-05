import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class SocketPage extends StatefulWidget {
  SocketPage({super.key, this.channel});
  WebSocketChannel? channel;

  @override
  State<SocketPage> createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("socket page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Form(
              child: TextFormField(
                  decoration: InputDecoration(labelText: "send any message"),
                  controller: editingController),
            ),
            StreamBuilder(
                stream: widget.channel?.stream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : ' '),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMyMessage,
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel?.sink.add(editingController.text);
    }
  }

  @override
  void dispose() {
    widget.channel?.sink.close();
  }
}
