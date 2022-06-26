import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../display_book.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> {
  List<bool> TrendingAlreadyClicked = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: inTrendingTab.length,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Positioned(
                  child: Card(
                    color: AppColors.searchBookCardColor,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DisplayBook(
                                      popularBookModel: inTrendingTab[index] ??
                                          Book(
                                              author_name: "author_name",
                                              book_name: "book_name",
                                              isbn: "isbn"),
                                    )),
                              ));
                            }),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    inTrendingTab[index]!.book_name,
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    inTrendingTab[index]!.author_name,
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (liked_books!
                                    .contains(inTrendingTab[index])) {
                                  liked_books!.remove(inTrendingTab[index]);
                                } else {
                                  liked_books!.add(inTrendingTab[index] ??
                                      Book(
                                          author_name: "author_name",
                                          book_name: "book_name",
                                          isbn: "isbn"));
                                }
                              });
                            },
                            child: Icon(
                              liked_books!.contains(inTrendingTab[index])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: liked_books!.contains(inTrendingTab[index])
                                  ? Colors.red
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
                                  popularBookModel: inTrendingTab[index] ??
                                      Book(
                                          author_name: "author_name",
                                          book_name: "book_name",
                                          isbn: "isbn"),
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
                              image: NetworkImage(inTrendingTab[index]!
                                  .image_address as String),
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
