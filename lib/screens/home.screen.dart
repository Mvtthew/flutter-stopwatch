import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hihi/widgets/stopwatch.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(CupertinoIcons.stopwatch),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
          ),
          Text("STOPer"),
        ],
      )),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Center(
                  child: Icon(
                CupertinoIcons.stopwatch,
                size: 60,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StopwatchWidget(),
          ],
        ),
      ),
    );
  }
}
