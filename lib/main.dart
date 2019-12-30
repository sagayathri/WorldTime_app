import 'package:flutter/material.dart';
import 'package:worldtime_flutterapp/pages/home.dart';
import 'package:worldtime_flutterapp/pages/initial_loading.dart';
import 'package:worldtime_flutterapp/pages/location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

