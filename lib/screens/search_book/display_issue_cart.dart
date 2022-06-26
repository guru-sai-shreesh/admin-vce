import 'dart:convert';

import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/project_model.dart';
import 'package:admin_vce/screens/search_book/display_book.dart';
import 'package:admin_vce/screens/search_book/search_book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayIssueCart extends StatefulWidget {
  const DisplayIssueCart({Key? key}) : super(key: key);

  @override
  State<DisplayIssueCart> createState() => _DisplayIssueCartState();
}

class _DisplayIssueCartState extends State<DisplayIssueCart> {
  bool isLoading = false;

  late TextEditingController controller = TextEditingController();

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
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 14),
              height: 42,
              color: Colors.transparent,
              child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: (() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SearchBook()));
                  }),
                  minWidth: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Send Issue Request",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          )),
                      // Padding(padding: EdgeInsets.only(left: 5)),
                      // Icon(Icons.camera_enhance)
                    ],
                  ))),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, right: 15),
                  child: Text("General Issue Cart",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          // padding:
                          //     EdgeInsets.only(top: 15, left: 15, right: 15),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: general_issue_cart!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 90,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Positioned(
                                    child: Card(
                                      color: Color.fromARGB(255, 61, 58, 58),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 80,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              width: 70,
                                            ),
                                            GestureDetector(
                                              onTap: (() {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: ((context) =>
                                                      DisplayBook(
                                                        popularBookModel:
                                                            general_issue_cart![
                                                                index],
                                                      )),
                                                ));
                                              }),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    200,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      general_issue_cart![index]
                                                          .book_name,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      general_issue_cart![index]
                                                          .author_name,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white70,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (general_issue_cart!
                                                      .contains(
                                                          general_issue_cart![
                                                              index])) {
                                                    general_issue_cart!.remove(
                                                        general_issue_cart![
                                                            index]);
                                                  } else {
                                                    general_issue_cart!.add(
                                                        general_issue_cart![
                                                            index]);
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                general_issue_cart!.contains(
                                                        general_issue_cart![
                                                            index])
                                                    ? Icons.close
                                                    : Icons.close,
                                                color: general_issue_cart!
                                                        .contains(
                                                            general_issue_cart![
                                                                index])
                                                    ? Colors.white
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DisplayBook(
                                                    popularBookModel:
                                                        general_issue_cart![
                                                            index],
                                                  ))),
                                        );
                                      }),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        elevation: 0,
                                        child: Container(
                                          height: 80,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    general_issue_cart![index]
                                                            .image_address ??
                                                        ""),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, right: 15),
                  child: Text("Bookbank Issue Cart",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          // padding:
                          //     EdgeInsets.only(top: 15, left: 15, right: 15),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bookbank_issue_cart!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 90,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Positioned(
                                    child: Card(
                                      color: Color.fromARGB(255, 61, 58, 58),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 80,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              width: 70,
                                            ),
                                            GestureDetector(
                                              onTap: (() {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: ((context) =>
                                                      DisplayBook(
                                                        popularBookModel:
                                                            bookbank_issue_cart![
                                                                index],
                                                      )),
                                                ));
                                              }),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    200,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      bookbank_issue_cart![
                                                              index]
                                                          .book_name,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      bookbank_issue_cart![
                                                              index]
                                                          .author_name,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white70,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (bookbank_issue_cart!
                                                      .contains(
                                                          bookbank_issue_cart![
                                                              index])) {
                                                    bookbank_issue_cart!.remove(
                                                        bookbank_issue_cart![
                                                            index]);
                                                  } else {
                                                    bookbank_issue_cart!.add(
                                                        bookbank_issue_cart![
                                                            index]);
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                bookbank_issue_cart!.contains(
                                                        bookbank_issue_cart![
                                                            index])
                                                    ? Icons.close
                                                    : Icons.close,
                                                color: bookbank_issue_cart!
                                                        .contains(
                                                            bookbank_issue_cart![
                                                                index])
                                                    ? Colors.white
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DisplayBook(
                                                    popularBookModel:
                                                        bookbank_issue_cart![
                                                            index],
                                                  ))),
                                        );
                                      }),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        elevation: 0,
                                        child: Container(
                                          height: 80,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    bookbank_issue_cart![index]
                                                            .image_address ??
                                                        ""),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
