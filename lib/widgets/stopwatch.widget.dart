import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({Key? key}) : super(key: key);

  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _animationController;
  bool _started = false;
  int _time = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _addMillisecond() {
    setState(() {
      _time += 1;
    });
  }

  void _toggleStarted() {
    setState(() {
      _started ? _animationController.reverse() : _animationController.forward();
      _started = !_started;
    });
  }

  void toggleStopwatch() {
    if (_started) {
      _timer.cancel();
    } else {
      _timer = new Timer.periodic(Duration(milliseconds: 10), (t) => _addMillisecond());
    }
    _toggleStarted();
  }

  String _parseTime() {
    double seconds = _time / 100;
    int minutes = (seconds / 60).floor();

    String minutesString = new NumberFormat("00").format(minutes);
    String secondsString = new NumberFormat("00.00").format(seconds);

    return "$minutesString:$secondsString";
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Stack(
              children: [
                Container(
                  height: 250.0,
                  width: 250.0,
                  child: Center(
                    child: Text(
                      _parseTime(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 250.0,
                  width: 250.0,
                  child: CircularProgressIndicator(
                    value: _time % 6000 / 6000,
                    strokeWidth: 16.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 50.0,
                      onPressed: toggleStopwatch,
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _animationController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
