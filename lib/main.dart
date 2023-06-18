import 'package:flutter/material.dart';
import 'package:ui_sistem_rawat_inap/page/pesanKamar.dart';
import 'package:ui_sistem_rawat_inap/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PesanKamar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
