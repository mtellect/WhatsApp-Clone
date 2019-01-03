import 'package:flutter/material.dart';
import 'package:whatsapp_clone/app_index.dart';
import 'package:whatsapp_clone/utils/colors.dart';

void main() => runApp(MyApp());

MaterialColor appColor = MaterialColor(
  blue3.value,
  <int, Color>{
    50: blue0,
    100: blue1,
    200: blue2,
    300: blue3,
    400: blue4,
    500: blue5,
    600: blue6,
    700: blue7,
    800: blue8,
    900: blue9,
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      home: AppIndex(),
    );
  }
}
