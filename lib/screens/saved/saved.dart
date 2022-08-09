import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:admin_vce/screens/saved/saved_books.dart';
import 'package:admin_vce/screens/saved/saved_projects.dart';
import 'package:admin_vce/screens/saved/saved_subscriptions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Saved extends StatefulWidget {
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
        return false;
      },
      child: Container(
        color: AppColors.primaryColor,
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
            drawer: NavigationDrawer(),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 25),
                  child: Text("Read-Later",
                      style: GoogleFonts.openSans(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                ListView(
                  padding: EdgeInsets.only(top: 15),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => SavedBooks())),
                        );
                      },
                      child: Card(
                          color: Colors.white70,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 25),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Books",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ]),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => SavedSubscriptions())),
                        );
                      },
                      child: Card(
                          color: Colors.white70,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 25),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subscriptions",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ]),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => SavedProjects())),
                        );
                      },
                      child: Card(
                          color: Colors.white70,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 25),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Projects",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ]),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => SavedBooks())),
                        );
                      },
                      child: Card(
                          color: Colors.white70,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 25),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Question Papers",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ]),
                          )),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
