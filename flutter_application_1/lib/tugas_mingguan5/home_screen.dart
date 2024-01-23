import 'package:flutter/material.dart';
import 'package:flutter_application_1/tugas_mingguan5/drawerScreen.dart';
import 'package:flutter_application_1/tugas_mingguan5/Models/chart_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawerscreen(),
      body: ListView.separated(
          itemBuilder: (ctx, i) {
            return ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(items[i].profileUrl.toString()),
              ),
              title: Text(
                items[i].name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(items[i].message.toString()),
              trailing: Text(items[i].time.toString()),
            );
          },
          separatorBuilder: (ctx, i) {
            return Divider();
          },
          itemCount: items.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create, color: Colors.white),
        backgroundColor: Color(0xFF6a9e0),
        onPressed: () {},
      ),
    );
  }
}
