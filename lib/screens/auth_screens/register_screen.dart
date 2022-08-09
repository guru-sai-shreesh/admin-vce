import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/auth_screens/login_screen.dart';
import 'package:admin_vce/screens/dashboard/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

File file = File("your initial file");

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      // ),
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "E-VCE",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: GradientText(
                      "Register Account",
                      colors: [
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        // Color(0xFF42A5F5),
                      ],
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: Color(0xFF0D47A1),
                          child: CircleAvatar(
                            radius: 71,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 69,
                              backgroundImage: NetworkImage(
                                  'https://yt3.ggpht.com/ytc/AKedOLRTjSE3cSLWjjTu06H1vmZ3bpTG8SrNONwsfrVh8Q=s900-c-k-c0x00ffffff-no-rj'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                file = File(result.files.single.path ?? "");
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                    "https://t4.ftcdn.net/jpg/02/83/72/41/360_F_283724163_kIWm6DfeFN0zhm8Pc0xelROcxxbAiEFI.jpg")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Username",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Username',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 47,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextField(
                          obscureText: true,
                          cursorHeight: 18,
                          cursorColor: AppColors.primaryColor,
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Display Name",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Display Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Personal Email",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Personal Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Gender",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Gender',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Date of Birth",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Date of Birth',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Phone Number",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Phone Number',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "About",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextField(
                          maxLines: 3,
                          cursorHeight: 18,
                          cursorColor: AppColors.primaryColor,
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter About yourself',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "Github Url",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Github Url',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          "LinkedIn Url",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
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
                            color: Colors.grey,
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
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter LinkedIn Url',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              // borderSide: BorderSide.none,
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
                    margin: EdgeInsets.only(left: 0, right: 0, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
