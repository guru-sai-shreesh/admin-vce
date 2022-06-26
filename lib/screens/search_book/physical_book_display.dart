import 'dart:convert';

import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/project_model.dart';
import 'package:admin_vce/screens/search_book/add_book/issue_physical_book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysicalBookDisplay extends StatefulWidget {
  final Book popularBookModel;
  const PhysicalBookDisplay({Key? key, required this.popularBookModel})
      : super(key: key);

  @override
  State<PhysicalBookDisplay> createState() =>
      _PhysicalBookDisplayState(popularBookModel);
}

class _PhysicalBookDisplayState extends State<PhysicalBookDisplay> {
  bool isLoading = false;

  final Book popularBookModel;

  late TextEditingController controller = TextEditingController();

  _PhysicalBookDisplayState(this.popularBookModel);

  Future scanBarcode() async {
    String scanResult = "";
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {}
    ;
    if (!mounted) return;
    controller.text = scanResult;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackgroundColor,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "E-VCE",
              style: TextStyle(color: Colors.white70),
            ),
            elevation:
                defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 25, right: 25, bottom: 14),
                  height: 42,
                  color: Colors.transparent,
                  child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: (() {
                        scanBarcode();
                      }),
                      minWidth: MediaQuery.of(context).size.width - 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Scan Accesion",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              )),
                          // Padding(padding: EdgeInsets.only(left: 5)),
                          // Icon(Icons.camera_enhance)
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.only(left: 0, right: 25, bottom: 14),
                  height: 42,
                  color: Colors.transparent,
                  child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IssuePhysicalBook(
                                  popularBookModel: popularBookModel,
                                )));
                      }),
                      minWidth: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              )),
                          // Padding(padding: EdgeInsets.only(left: 5)),
                          // Icon(Icons.camera_enhance)
                        ],
                      ))),
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Book Image:"),
                            SizedBox(
                              width: 20,
                            ),
                            Image.network(
                              popularBookModel.image_address ?? "",
                              height: 115,
                              width: 76,
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Book Name:"),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(popularBookModel.book_name)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ISBN:"),
                            SizedBox(
                              width: 20,
                            ),
                            Text(popularBookModel.isbn),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Author Name:"),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(popularBookModel.book_name)),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Relavence:"),
                            SizedBox(
                              width: 20,
                            ),
                            for (var item
                                in popularBookModel.relavence ?? ["None"])
                              Text(item + " "),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Publisher Name:"),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 220,
                                child: Text(popularBookModel.publisher ??
                                    "publisher name")),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity:"),
                            SizedBox(
                              width: 20,
                            ),
                            Text(popularBookModel.quantity.toString()),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Location:"),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Floor: "),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Rack No: "),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Floor: "),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Edition:"),
                            SizedBox(
                              width: 20,
                            ),
                            Text(popularBookModel.edition ?? "--"),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Number of pages:"),
                            SizedBox(
                              width: 20,
                            ),
                            Text(popularBookModel.no_of_pages.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 47,
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  controller: controller,
                  cursorHeight: 18,
                  cursorColor: AppColors.primaryColor,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white60,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white10,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF1976D2),
                        width: 2,
                      ),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide:
                    //       const BorderSide(color: Colors.grey),
                    // ),
                    hintStyle: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white60,
                    ),
                    hintText: 'Accsesion number of Book',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
