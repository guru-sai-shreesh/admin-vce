import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/search_book/display_book.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

bool isLoaded = false;
List<Book>? display_list = [];

class ItemList extends StatefulWidget {
  final String keyword, search_type;
  const ItemList({Key? key, required this.keyword, required this.search_type})
      : super(key: key);

  @override
  State<ItemList> createState() =>
      _ItemListState(keyword: keyword, search_type: search_type);
}

class _ItemListState extends State<ItemList> {
  final String keyword, search_type;
  _ItemListState({required this.keyword, required this.search_type});

  getDisplayList() async {
    switch (search_type) {
      case "tag":
        var data = display_list!.where((element) =>
            element.isbn ==
            Book(
                    author_name: keyword,
                    book_name: keyword,
                    isbn: keyword + "keyword",
                    image_address:
                        "https://edit.org/images/cat/book-covers-big-2019101610.jpg")
                .isbn);
        if (data.isEmpty) {
          display_list = [
            (Book(
                author_name: keyword,
                book_name: keyword,
                isbn: keyword + "keyword",
                image_address:
                    "https://edit.org/images/cat/book-covers-big-2019101610.jpg"))
          ];
        }
        ;
        break;
      case "categeory":
        var data = display_list!.where((element) =>
            element.isbn ==
            Book(
                    author_name: keyword,
                    book_name: keyword,
                    isbn: keyword + "keyword",
                    image_address:
                        "https://edit.org/images/cat/book-covers-big-2019101610.jpg")
                .isbn);
        if (data.isEmpty) {
          display_list = [
            (Book(
                author_name: keyword,
                book_name: keyword,
                isbn: keyword + "keyword",
                image_address:
                    "https://edit.org/images/cat/book-covers-big-2019101610.jpg"))
          ];
        }
        ;
        break;
      default:
        var data = display_list!.where((element) =>
            element.isbn ==
            Book(
                    author_name: keyword,
                    book_name: keyword,
                    isbn: keyword + "keyword",
                    image_address:
                        "https://edit.org/images/cat/book-covers-big-2019101610.jpg")
                .isbn);
        if (data.isEmpty) {
          display_list = [
            (Book(
                author_name: keyword,
                book_name: keyword,
                isbn: keyword + "keyword",
                image_address:
                    "https://edit.org/images/cat/book-covers-big-2019101610.jpg"))
          ];
        }
        ;
        break;
    }
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
      body: FutureBuilder(
          future: getDisplayList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 25),
                    child: Text("Search result..",
                        style: GoogleFonts.openSans(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 32, 32, 32),
                        )),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: display_list!.length,
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
                                              builder: ((context) =>
                                                  DisplayBook(
                                                      popularBookModel:
                                                          display_list![
                                                              index])),
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
                                                  display_list![index]
                                                      .book_name,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  display_list![index]
                                                      .author_name,
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
                                            var data = liked_books!.where(
                                                (element) =>
                                                    element.isbn ==
                                                    display_list![index].isbn);
                                            setState(() {
                                              if (data.isNotEmpty) {
                                                liked_books!
                                                    .remove(data.elementAt(0));
                                              } else {
                                                liked_books!
                                                    .add(display_list![index]);
                                              }
                                            });
                                          },
                                          child: Icon(
                                            liked_books!
                                                    .where((element) =>
                                                        element.isbn ==
                                                        display_list![index]
                                                            .isbn)
                                                    .isNotEmpty
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: liked_books!
                                                    .where((element) =>
                                                        element.isbn ==
                                                        display_list![index]
                                                            .isbn)
                                                    .isNotEmpty
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
                                              popularBookModel:
                                                  display_list![index]))),
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
                                                display_list![index]
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
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
