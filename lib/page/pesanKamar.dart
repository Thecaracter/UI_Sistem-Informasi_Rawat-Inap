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
                alignment: Alignment.topLeft,
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
              Stack(
                children: [
                  Image.asset(
                    'assets/vector_pesankamar.png',
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                    height: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 250,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff15AFA7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Warna bayangan
                                      blurRadius: 30, // Jarak blur bayangan
                                      offset: Offset(0,
                                          3), // Posisi bayangan relatif terhadap teks
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "SIRANAP",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
