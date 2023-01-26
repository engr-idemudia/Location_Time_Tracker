import 'package:flutter/material.dart';
import 'package:location_time_tracker/pages/choose_location.dart';
import 'package:location_time_tracker/pages/home.dart';
import 'package:location_time_tracker/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
