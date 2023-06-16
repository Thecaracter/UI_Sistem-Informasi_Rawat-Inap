import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff45A28C),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            // color: Colors.amber,
            decoration: BoxDecoration(
              color: Color(0xff94C973),
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
                      "SIRANAP",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(
                                0, 8), // Adjust the offset values as needed
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/bed_vektor.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "Sistem Informasi dan Pesan Kamar Rawat Inap Rumah Sakit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "informasi layanan ruangan rawat inap yang selalu paling baru lengkap dengan nomor telfon rumah sakit terdekat dari lokasi anda.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size as needed
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Color(0xffDED93E),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.cloud_upload_outlined,
                        color: Colors
                            .white), // Change the color of the icon to white
                    label: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Change the text color to white
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
