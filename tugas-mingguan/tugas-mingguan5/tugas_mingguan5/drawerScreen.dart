import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawerscreen extends StatefulWidget {
  @override
  _DrawerscreenState createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Hartati Viriya"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("asset/img/doraemon.jpg "),
          ),
          accountEmail: Text("viriyahartati@gmail.com"),
        ),
        DrawerListTile(
          iconData: Icons.group,
          title: "Newgroup",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.lock,
          title: "New secret group",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.notifications,
          title: "New channel chat",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.contacts,
          title: "contact",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.bookmark_border,
          title: "Saved message",
          onTilePressed: () {},
        ),
        DrawerListTile(
          iconData: Icons.phone,
          title: "Calls",
          onTilePressed: () {},
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({
    Key? key,
    required this.iconData,
    this.title,
    this.onTilePressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
