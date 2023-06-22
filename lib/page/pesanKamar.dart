import 'package:flutter/material.dart';
import 'package:ui_sistem_rawat_inap/page/dashboard.dart';
import 'package:ui_sistem_rawat_inap/service/service.dart';

class PesanKamar extends StatefulWidget {
  const PesanKamar({super.key});

  @override
  State<PesanKamar> createState() => _PesanKamarState();
}

class _PesanKamarState extends State<PesanKamar> {
  dynamic selectedProvince;
  late int selectedOption;
  ApiService apiService = ApiService();
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    selectedOption = 1;
    ProvinsiData();
  }

  Future<void> ProvinsiData() async {
    try {
      List<dynamic> provinsiData = await apiService.fetchProvincesData();
      setState(() {
        data = provinsiData;
      });

      print(data);
    } catch (error) {
      // Handle any errors that occurred during the API call
      print('Error: $error');
    }
  }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WillPopScope(
                          onWillPop: () async => false,
                          child: Dashboard(),
                        ),
                      ),
                    );
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
                      height: MediaQuery.of(context).size.height / 1.5,
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
                          ),
                          Text(
                            "Pilih Jenis Kamar Tidur",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedOption = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectedOption == 1
                                            ? Colors.white
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selectedOption == 1
                                          ? Color(0xffDED93E)
                                          : Colors.transparent,
                                    ),
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Text(
                                        'Covid-19',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedOption = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectedOption == 2
                                            ? Colors.white
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: selectedOption == 2
                                          ? Color(0xffDED93E)
                                          : Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Text(
                                        'non-Covid-19',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Pilih Provinsi",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            // Menentukan lebar Container sesuai lebar layar
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Mengatur warna latar belakang menjadi putih
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: selectedProvince,
                                  hint: Text(
                                    'Silahkan pilih provinsi',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  items: data.map<DropdownMenuItem<dynamic>>(
                                      (dynamic item) {
                                    return DropdownMenuItem<dynamic>(
                                      value: item,
                                      child: Text(
                                        item['name'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedProvince = newValue;
                                    });
                                  },
                                  isExpanded: true,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 28.0,
                                  iconEnabledColor: Colors.grey,
                                  dropdownColor: Colors
                                      .white, // Mengatur warna latar belakang dropdown menjadi putih
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Pilih Kabupaten/Kota",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            // Menentukan lebar Container sesuai lebar layar
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Mengatur warna latar belakang menjadi putih
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: selectedProvince,
                                  hint: Text(
                                    'Silahkan pilih Kabupaten',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  items: data.map<DropdownMenuItem<dynamic>>(
                                      (dynamic item) {
                                    return DropdownMenuItem<dynamic>(
                                      value: item,
                                      child: Text(
                                        item['name'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedProvince = newValue;
                                    });
                                  },
                                  isExpanded: true,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 28.0,
                                  iconEnabledColor: Colors.grey,
                                  dropdownColor: Colors
                                      .white, // Mengatur warna latar belakang dropdown menjadi putih
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.search),
                            label: const Text("Cari Kamar",
                                style: TextStyle(fontSize: 20.0)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff94C97),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {},
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
