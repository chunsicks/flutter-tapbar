import 'dart:math';

import 'package:flutter/material.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: 200,
        color: Colors.red,
      ),
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GetinThere",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "프로그래머/작가/강사",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "데어 프로그래밍",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfo("50", "Posts"),
              const _buildLine(),
              _buildInfo("10", "Likes"),
              const _buildLine(),
              _buildInfo("3", "Share"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("Follw 버튼 클릭됨");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 45,
                      child: Text(
                        "Follow",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("Message 버튼 클릭됨");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 45,
                      child: Text(
                        "Message",
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
         Expanded(child: ProfileTab()),
        ],
      ),
    );
  }

  Column _buildInfo(String count, String title) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              GridView.builder(
                gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemCount: 50,
                itemBuilder: (context, index) => Container(
                  width: 100,
                  height: 100,
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

class _buildLine extends StatelessWidget {
  const _buildLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 60,
      color: Colors.blue,
    );
  }
}
