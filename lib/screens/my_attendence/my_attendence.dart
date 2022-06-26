import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/my_attendence/attendence.dart';
import 'package:admin_vce/screens/my_attendence/attendence_percentage.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:admin_vce/widget/custom_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAttendence extends StatefulWidget {
  @override
  State<MyAttendence> createState() => _MyAttendenceState();
}

class _MyAttendenceState extends State<MyAttendence>
    with TickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Attendence"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Percentage"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
          return false;
        },
        child: Container(
          color: AppColors.primaryBackgroundColor,
          child: Scaffold(
            appBar: AppBar(
              title: Text("E-VCE"),
              elevation:
                  defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                isScrollable: true,
                unselectedLabelColor: Colors.white70,
                labelPadding: EdgeInsets.all(0),
                indicatorPadding: EdgeInsets.all(0),
                indicator: RoundedRectangleTabIndicator(
                    weight: 2, width: 10, color: Colors.black),
                labelStyle: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                tabs: myTabs,
              ),
            ),
            // appBar: AppBar(
            //   title: Text("E-VCE"),
            //   backgroundColor: Colors.transparent,
            //   elevation: 0.0,
            //   iconTheme: IconThemeData(color: Colors.black),
            // ),
            backgroundColor: Colors.transparent,
            drawer: NavigationDrawer(),
            body: Container(
              decoration: BoxDecoration(
                color: AppColors.layerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TabBarView(controller: _tabController, children: [
                Attendence(),
                AttendencePercentage(),
              ]),
            ),
          ),
        ));
  }
}
