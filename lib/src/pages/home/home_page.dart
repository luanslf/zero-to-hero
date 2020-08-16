import 'package:flutter/material.dart';
import 'package:zero_to_hero/src/pages/home/future_tab_bar_view.dart';
import 'package:zero_to_hero/src/pages/home/stream_tab_bar_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Future'),
              Tab(text: 'Stream'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureTabBarView(),
            StreamTabBarView(),
          ],
        ),
      ),
    );
  }
}
