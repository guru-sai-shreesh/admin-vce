import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/grades/exam_list.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class Grades extends StatefulWidget {
  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  final List<String> semList = <String>[
    'Sem 1',
    'Sem 2',
    'Sem 3',
    'Sem 4',
    'Sem 5',
    'Sem 6',
    'Sem 7',
    'Sem 8',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
          return false;
        },
        child: Container(
          color: AppColors.primaryBackgroundColor,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "E-VCE",
                  style: TextStyle(color: AppColors.appBarTitle),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              backgroundColor: Colors.transparent,
              drawer: NavigationDrawer(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 30),
                    child: Text("Grades",
                        style: GoogleFonts.openSans(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
                  ),
                  ListView.builder(
                      itemCount: semList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: ((context) => ExamList())),
                            );
                          },
                          child: Card(
                              color: Colors.white70,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin:
                                  EdgeInsets.only(left: 25, right: 25, top: 10),
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.only(left: 25),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        semList[index],
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ]),
                              )),
                        );
                      }),
                ],
              )),
        ));
  }
}
