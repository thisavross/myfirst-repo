import 'package:flutter/material.dart';
import 'package:profile_insta/screen/igtv_screen.dart';
import 'package:profile_insta/screen/gallery_screen.dart';
import 'package:profile_insta/screen/reels_screen.dart';

class ProfileBaseScreen extends StatefulWidget {
  @override
  State<ProfileBaseScreen> createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      "user101",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(
                            Icons.add_box_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.black),
                          onPressed: () {}),
                    ]))),
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverList(
                    delegate: SliverChildListDelegate([
                  profileHeaderWidget(context),
                ]))
              ];
            },
            body: Column(
              children: [
                Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.grid_on_sharp, color: Colors.black),
                        ),
                        Tab(
                          icon: Image.asset(
                            'asset/image/profile inta.png',
                            height: 30,
                            width: 30,
                          ),
                        )
                      ],
                    )),
                Expanded(
                  child: TabBarView(children: [
                    Gallery(),
                    Igtv(),
                    Reels(),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
  
  profileHeaderWidget(BuildContext context) {}
}
