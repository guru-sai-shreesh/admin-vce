import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaperDisplay extends StatefulWidget {
  @override
  State<PaperDisplay> createState() => _PaperDisplayState();
}

class _PaperDisplayState extends State<PaperDisplay> {
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
    return Container(
      color: Color.fromARGB(255, 152, 209, 255),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "E-VCE",
              style: TextStyle(color: Colors.black87),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Center(
              child: Text("Papers"),
            ),
          )),
    );
  }
}
