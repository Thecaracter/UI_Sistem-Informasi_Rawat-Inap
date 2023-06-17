import 'package:flutter/material.dart';
import 'package:ui_sistem_rawat_inap/onboarding.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff94C973),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    color: Color(0xff45A28C),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),

                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Container(
                          child: Text(
                            "Silahkan Mendaftar Dibawah ini",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0,
                                      8), // Adjust the offset values as needed
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/signup.png",
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 3,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Silahkan mendaftarkan data diri anda dibawah ini",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontFamily: "Poopins",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                                fontSize:
                                    14), // Mengatur ukuran teks menjadi 24
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Full Name",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                                fontSize:
                                    14), // Mengatur ukuran teks menjadi 24
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email / Phone Number",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.cloud_done_outlined,
                              color: Colors
                                  .white), // Change the color of the icon to white
                          label: const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors
                                  .white, // Change the text color to white
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            side: BorderSide(
                                color: Colors.white), // Add a white outline
                            backgroundColor: Color(0xff45A28C),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WillPopScope(
                                  onWillPop: () async => false,
                                  child: OnBoarding(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
