import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/dashboard/homescreen.dart';
import 'package:admin_vce/screens/auth_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      // ),
      child: Stack(
        children: [
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height * 0.62,
          //     decoration: BoxDecoration(
          //       color: AppColors.layerOneBg,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(20.0),
          //           topRight: Radius.circular(20.0)),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * 0.94,
          //     height: MediaQuery.of(context).size.height * 0.5,
          //     decoration: BoxDecoration(
          //       color: AppColors.layerTwoBg,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(60.0),
          //         bottomRight: Radius.circular(60.0),
          //         bottomLeft: Radius.circular(60.0),
          //       ),
          //     ),
          //   ),
          // ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.28),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "VASAVI COLLEGE OF",
                                      style: GoogleFonts.openSans(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF42A5F5),
                                      ),
                                    ),
                                    Text(
                                      "ENGINEERING",
                                      style: GoogleFonts.openSans(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF42A5F5),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/images/clg_logo.png",
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Devoloped By ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                const Text(
                                  'Guru Sai Shreesh, Chandrashekar',
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white70,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                const Text(
                                  '',
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(217, 255, 255, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Text(
                              "Username/Email",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 47,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              cursorHeight: 18,
                              cursorColor: AppColors.primaryColor,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white60,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.white10,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF1976D2),
                                    width: 2,
                                  ),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                //   borderSide:
                                //       const BorderSide(color: Colors.grey),
                                // ),
                                hintStyle: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white60,
                                ),
                                hintText: 'Enter Username',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Text(
                              "Password",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 47,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              cursorHeight: 18,
                              cursorColor: AppColors.primaryColor,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white60,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white10,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF1976D2),
                                  ),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                //   borderSide:
                                //       const BorderSide(color: Colors.grey),
                                // ),
                                hintStyle: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white60,
                                ),
                                hintText: 'Enter Password',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(top: 7.5, bottom: 7.5),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyRegister()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Not registered? ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
