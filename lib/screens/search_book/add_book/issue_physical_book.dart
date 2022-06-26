import 'dart:convert';

import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/project_model.dart';
import 'package:admin_vce/screens/search_book/search_book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class IssuePhysicalBook extends StatefulWidget {
  final Book popularBookModel;
  const IssuePhysicalBook({Key? key, required this.popularBookModel})
      : super(key: key);

  @override
  State<IssuePhysicalBook> createState() =>
      _IssuePhysicalBookState(popularBookModel);
}

class _IssuePhysicalBookState extends State<IssuePhysicalBook> {
  bool isLoading = false;

  final Book popularBookModel;

  late TextEditingController controller = TextEditingController();

  _IssuePhysicalBookState(this.popularBookModel);

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
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                height: MediaQuery.of(context).size.height * 0.4,
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
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Book cover:  ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )),
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
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Book name:  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: popularBookModel.book_name,
                                  ),
                                ],
                              ),
                            )),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Accession number:  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: '--',
                                  ),
                                ],
                              ),
                            )),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Issuing time:  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: '--',
                                  ),
                                ],
                              ),
                            )),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'ISBN:  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: popularBookModel.isbn,
                                  ),
                                ],
                              ),
                            )),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Author name:  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: popularBookModel.author_name,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                  height: 42,
                  color: Colors.transparent,
                  child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: (() {
                        general_issue_cart!.add(popularBookModel);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchBook()));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Add to General Issue Cart",
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              )),
                          // Padding(padding: EdgeInsets.only(left: 5)),
                          // Icon(Icons.camera_enhance)
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  height: 42,
                  color: Colors.transparent,
                  child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: (() {
                        bookbank_issue_cart!.add(popularBookModel);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchBook()));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Add to Bookbank Cart",
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              )),
                          // Padding(padding: EdgeInsets.only(left: 5)),
                          // Icon(Icons.camera_enhance)
                        ],
                      ))),
            ],
          )),
    );
  }
}
