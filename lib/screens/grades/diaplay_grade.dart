import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GradeDisplay extends StatefulWidget {
  const GradeDisplay({Key? key}) : super(key: key);

  @override
  State<GradeDisplay> createState() => _GradeDisplayState();
}

class _GradeDisplayState extends State<GradeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-VCE"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
        backgroundColor: defaultTargetPlatform == TargetPlatform.android
            ? Colors.white
            : Colors.transparent,
      ),
      body: Center(
        child: Text("Grades"),
      ),
    );
  }
}
