import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectItem extends StatefulWidget {
  const CollectItem({Key? key}) : super(key: key);

  @override
  State<CollectItem> createState() => _CollectItemState();
}

class _CollectItemState extends State<CollectItem> {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController accesion_controller = TextEditingController();
  Future scanBarcode() async {
    String scanResult = "";
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {}
    ;
    if (!mounted) return;
    if (accesion_controller.text == "") {
      accesion_controller.text = scanResult;
    } else {
      accesion_controller.text = accesion_controller.text + ", " + scanResult;
    }
  }

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAutoCompleteData();
  }

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
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, bottom: 25, right: 30),
        height: 49,
        color: Colors.transparent,
        child: FlatButton(
          color: Color.fromARGB(255, 17, 149, 189),
          onPressed: (() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CollectItem()));
          }),
          minWidth: 100,
          child: Text("Update",
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Collect Book",
                            style: GoogleFonts.openSans(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 32, 32, 32),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: accesion_controller,
                        decoration: InputDecoration(
                          label: Text("Accesion Number"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Accesion Number",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        color: Color.fromRGBO(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Icon(Icons.camera_enhance),
                            SizedBox(
                              width: 5,
                            ),
                            FlatButton(
                              color: Color.fromARGB(255, 19, 136, 171),
                              onPressed: (() {
                                scanBarcode();
                              }),
                              minWidth: 100,
                              child: Text("Scan Barcode",
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
