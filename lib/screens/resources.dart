import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Resources extends StatefulWidget {
  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("E-VCE"),
            elevation:
                defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
            backgroundColor: defaultTargetPlatform == TargetPlatform.android
                ? Colors.white
                : Colors.transparent,
          ),
          // appBar: AppBar(
          //   title: Text("E-VCE"),
          //   backgroundColor: Colors.transparent,
          //   elevation: 0.0,
          //   iconTheme: IconThemeData(color: Colors.black),
          // ),
          drawer: NavigationDrawer(),
          body: Container(
            child: Center(
              child: Text("Resources"),
            ),
          )),
    );
  }
}
