import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/screens/grades/diaplay_grade.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamList extends StatefulWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  State<ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  @override
  Widget build(BuildContext context) {
    final List<String> examList = <String>[
      'Quiz 1',
      'Internal 1',
      'Quiz 2',
      'Internal 2',
      'Quiz 3',
      'Sem',
    ];
    return Container(
      color: AppColors.primaryBackgroundColor,
      child: Scaffold(
          appBar: AppBar(
            title: Text("E-VCE"),
            elevation:
                defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: ListView.builder(
              itemCount: examList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => GradeDisplay())),
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
                        height: 60,
                        padding: EdgeInsets.only(left: 25),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                examList[index],
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                      )),
                );
              })),
    );
  }
}
