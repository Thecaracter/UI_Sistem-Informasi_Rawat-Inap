import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  DateTime? selectedDay;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff49A18C),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 33,
                ),
                color: Color(0xff49A18C),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          'assets/Login.png'), // Ganti dengan path gambar profil Anda
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Hi, Rizqi Nur Andi Putra',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Icon(
                      Icons.notifications_active,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Define a variable to store the selected day

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
                      selectedDay = selectedDateTime; // Update the selected day
                    });
                  },
                  onPageChanged: (focusedDay) {
                    setState(() {
                      selectedDay =
                          null; // Reset the selected day when changing the page
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
            ],
          ),
        ),
      ),
    );
  }
}
