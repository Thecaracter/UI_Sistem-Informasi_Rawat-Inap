import 'package:flutter/material.dart';

class PesanKamar extends StatefulWidget {
  const PesanKamar({super.key});

  @override
  State<PesanKamar> createState() => _PesanKamarState();
}

class _PesanKamarState extends State<PesanKamar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffB1D8B7),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () {
                  // Tindakan yang akan dilakukan saat tombol ditekan
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
