import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:admin_vce/screens/search_book/display_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksIssued extends StatefulWidget {
  const BooksIssued({Key? key}) : super(key: key);

  @override
  State<BooksIssued> createState() => _BooksIssuedState();
}

class _BooksIssuedState extends State<BooksIssued> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        body: FutureBuilder(
            future: fetchTop10(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 25),
                      child: Text("Books Issued",
                          style: GoogleFonts.openSans(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: issuedBooks.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Positioned(
                                  child: Card(
                                    color: AppColors.bookIssuedCardColor,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 90,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: (() {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: ((context) =>
                                                    DisplayBook(
                                                      popularBookModel:
                                                          issuedBooks[index]!,
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
                                                    issuedBooks[index]!
                                                        .book_name,
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    issuedBooks[index]!
                                                        .author_name,
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    issuedBooks[index]!
                                                        .accesionNumber,
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                issuedBooks[index]!.issueDate,
                                              ),
                                              Spacer(),
                                              Text(
                                                issuedBooks[index]!.dueDate,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
