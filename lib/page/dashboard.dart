import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ui_sistem_rawat_inap/login.dart';
import 'package:ui_sistem_rawat_inap/page/pesanKamar.dart';
import 'package:ui_sistem_rawat_inap/service/service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? selectedDay;
  ApiService apiService = ApiService();
  List<dynamic> data = [];
  int dataLimit = 10;
  int currentDataCount = 10;

  @override
  void initState() {
    super.initState();
    ambil_data();
  }

  Future<void> ambil_data() async {
    try {
      var ambil_data = await apiService.fetchHospitalData();
      setState(() {
        data = ambil_data;
      });
    } catch (error) {
      // Handle any errors that occurred during the API call
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff49A18C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xff49A18C),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 10,
                  ),
                  color: Color(0xff49A18C),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/Login.png'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Hi, Rizqi Nur Andi Putra',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Tindakan yang dijalankan saat ikon notifications_active diklik
                            },
                            child: Icon(
                              Icons.notifications_active,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WillPopScope(
                                    onWillPop: () async => false,
                                    child: Login(),
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.logout,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 20),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(DateTime.now().year - 1),
                    lastDay: DateTime(DateTime.now().year + 1),
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xff45A28C),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xff45A28C),
                        shape: BoxShape.circle,
                      ),
                      markerDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      outsideDaysVisible: false,
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onDaySelected:
                        (DateTime selectedDateTime, DateTime focusedDay) {
                      setState(() {
                        selectedDay = selectedDateTime;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        selectedDay = null;
                      });
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(date, selectedDay ?? DateTime.now());
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "PCR Negative",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[400],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Berlaku Hingga 10 Maret 2021",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Tambahkan logika untuk tombol share di sini
                        },
                        icon: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(3.141592653589793),
                          child: Icon(
                            Icons.reply,
                            size: 24.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Rumah Sakit Tersedia",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[400],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hospitalName = data[index]?['name'] ?? '';
                              String Phone = data[index]?['phone'] ?? '';
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green[50],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x19000000),
                                        blurRadius: 24,
                                        offset: Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  hospitalName,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green[400],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Text(
                                                  Phone,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // Tambahkan logika untuk tombol share di sini
                                        },
                                        icon: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(
                                              3.141592653589793),
                                          child: Icon(
                                            Icons.reply,
                                            size: 24.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add_circle_outline),
          label: const Text(
            "Pesan Kamar",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color(0xff60BA0F),
            minimumSize: Size(100, 40),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WillPopScope(
                  onWillPop: () async => false,
                  child: PesanKamar(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
