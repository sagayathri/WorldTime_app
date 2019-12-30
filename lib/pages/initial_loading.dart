import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime_flutterapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime worldTime = WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
            color: Colors.red,
            size: 50.0,
          ),
      )
    );
  }
}
