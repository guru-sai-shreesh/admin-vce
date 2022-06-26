import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:admin_vce/screens/search_book/display_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class Saved extends StatefulWidget {
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
        return false;
      },
      child: Container(
        color: AppColors.primaryColor,
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "E-VCE",
                style: TextStyle(color: AppColors.appBarTitle),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            drawer: NavigationDrawer(),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 25),
                  child: Text("Saved Books",
                      style: GoogleFonts.openSans(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                ListView.builder(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: saved_books!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Positioned(
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 90,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 90,
                                        width: 85,
                                      ),
                                      GestureDetector(
                                        onTap: (() {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: ((context) => DisplayBook(
                                                  popularBookModel:
                                                      saved_books![index],
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
                                                saved_books![index].book_name,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                saved_books![index].author_name,
                                                style: GoogleFonts.openSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey,
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
                                            if (saved_books!.contains(
                                                saved_books![index])) {
                                              saved_books!
                                                  .remove(saved_books![index]);
                                            } else {
                                              saved_books!
                                                  .add(saved_books![index]);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          saved_books!
                                                  .contains(saved_books![index])
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          color: saved_books!
                                                  .contains(saved_books![index])
                                              ? Colors.grey
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
                                        builder: ((context) => DisplayBook(
                                              popularBookModel:
                                                  saved_books![index],
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
                                  elevation: 4.99,
                                  child: Container(
                                    height: 115,
                                    width: 76,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              saved_books![index]
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
              ],
            )),
      ),
    );
  }
}
