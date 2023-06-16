import 'package:flutter/material.dart';
import 'package:ui_sistem_rawat_inap/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          // Lapisan belakang
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bed_1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              // Lapisan belakang
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/gradient_backgroud.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 200),
                    child: Image.asset(
                      "assets/logo.png",
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
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
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Sistem Informasi Rawat Inap",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
