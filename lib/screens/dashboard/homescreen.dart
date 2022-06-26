import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  null_builder() async {}

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null_builder(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: AppColors.primaryBackgroundColor,
              child: Scaffold(
                  appBar: AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    title: Text(
                      "E-VCE",
                      style: TextStyle(color: AppColors.appBarTitle),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  backgroundColor: Colors.transparent,
                  // appBar: AppBar
                  //   title: Text("E-VCE"),
                  //   elevation: defaultTargetPlatform == TargetPlatform.android
                  //       ? 0.0
                  //       : 0.0,
                  //   backgroundColor:
                  //       defaultTargetPlatform == TargetPlatform.android
                  //           ? Colors.transparent
                  //           : Colors.transparent,
                  // ),
                  // appBar: AppBar(
                  //   title: Text("E-VCE"),
                  //   backgroundColor: Colors.transparent,
                  //   elevation: 0.0,
                  //   iconTheme: IconThemeData(color: Colors.black),
                  // ),
                  drawer: NavigationDrawer(),
                  body: Container()),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.cover),
              ),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("E-VCE"),
                    elevation: defaultTargetPlatform == TargetPlatform.android
                        ? 0.0
                        : 0.0,
                    backgroundColor:
                        defaultTargetPlatform == TargetPlatform.android
                            ? Colors.transparent
                            : Colors.transparent,
                  ),
                  body: Center(child: CircularProgressIndicator())),
            );
          }
        }));
  }
}
