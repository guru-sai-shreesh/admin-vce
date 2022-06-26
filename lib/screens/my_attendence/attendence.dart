import 'package:admin_vce/model/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static fromHex(String s) {}
}

class _AttendenceState extends State<Attendence> {
  final List<bool> isPresent = <bool>[
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    true,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: isPresent.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.1,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.025,
                right: MediaQuery.of(context).size.width * 0.025,
                top: 10),
            color: isPresent[index] ? AppColors.primaryColor : Color(0xffFFFFF),
            child: Container(
              height: 52,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.035),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subject Name",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 3)),
                        Text(
                          "Start-End Time",
                          style: GoogleFonts.openSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                          ),
                        )
                      ]),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Date",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
