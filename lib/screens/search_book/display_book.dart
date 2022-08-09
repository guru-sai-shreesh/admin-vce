import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/search_book/edit_book.dart';
import 'package:admin_vce/screens/search_book/physical_book_display.dart';
import 'package:admin_vce/widget/custom_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayBook extends StatefulWidget {
  final Book popularBookModel;
  const DisplayBook({Key? key, required this.popularBookModel})
      : super(key: key);

  @override
  State<DisplayBook> createState() =>
      _DisplayBookState(popularBookModel: popularBookModel);
}

class _DisplayBookState extends State<DisplayBook>
    with TickerProviderStateMixin {
  bool saveClicked = false;
  bool editClicked = false;
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Description"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Rating"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Similar"),
      ),
    ),
  ];

  final Book popularBookModel;

  _DisplayBookState({required this.popularBookModel});

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
      color: AppColors.primaryBackgroundColor,
      child: Scaffold(
        bottomNavigationBar: Row(children: [
          Container(
            margin: EdgeInsets.only(left: 25, bottom: 14),
            height: 42,
            color: Colors.transparent,
            child: FlatButton(
              color: AppColors.primaryColor,
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditBook(popularBookModel: popularBookModel)));
              }),
              minWidth: 20,
              child: Icon(
                Icons.edit_rounded,
                color: editClicked ? Colors.black : Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, right: 25, bottom: 14),
              height: 42,
              color: Colors.transparent,
              child: FlatButton(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: (() {
                    setState(() {
                      if (saved_books!.contains(popularBookModel)) {
                        saved_books!.remove(popularBookModel);
                      } else {
                        saved_books!.add(popularBookModel);
                      }
                    });
                  }),
                  minWidth: MediaQuery.of(context).size.width - 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save Book",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Icon(
                        saved_books!.contains(popularBookModel)
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_outline_rounded,
                        color: Colors.white,
                      )
                    ],
                  )))
        ]),
        body: Container(
          color: AppColors.primaryBackgroundColor,
          child: SafeArea(
              child: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  flexibleSpace: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        Align(
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.2,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                    popularBookModel.image_address ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 25, right: 25),
                                child: Text(
                                  popularBookModel.book_name,
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  popularBookModel.author_name,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  "Availability: E|P",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 115, 115, 115),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  FlatButton(
                                    color: AppColors.primaryColor,
                                    onPressed: (() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhysicalBookDisplay(
                                                      popularBookModel:
                                                          popularBookModel)));
                                    }),
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                    child: Text("Physical",
                                        style: GoogleFonts.openSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  FlatButton(
                                    color: AppColors.primaryColor,
                                    onPressed: (() {}),
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                    child: Text(
                                      "E-Book",
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                            height: 25,
                            margin: EdgeInsets.only(top: 5),
                            child: DefaultTabController(
                              length: myTabs.length,
                              child: TabBar(
                                controller: _tabController,
                                labelPadding: EdgeInsets.all(0),
                                indicatorPadding: EdgeInsets.all(0),
                                isScrollable: true,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                labelStyle: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                indicator: RoundedRectangleTabIndicator(
                                    weight: 2, width: 10, color: Colors.black),
                                unselectedLabelStyle: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                tabs: myTabs,
                              ),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 800,
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 25, right: 25),
                                    child: Text(popularBookModel.description ??
                                        "NO Description"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Text('Rating'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Text('Similar'),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ]))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
