import 'dart:convert';

import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/navigation_drawers/navigation_drawer.dart';
import 'package:admin_vce/screens/search_book/add_book/enter_isbn.dart';
import 'package:admin_vce/screens/search_book/add_book/item_issue.dart';
import 'package:admin_vce/screens/search_book/add_book/return_book.dart';
import 'package:admin_vce/screens/search_book/display_book.dart';
import 'package:admin_vce/screens/search_book/display_issue_cart.dart';
import 'package:admin_vce/screens/items_list.dart';
import 'package:admin_vce/screens/search_book/new_tab/new_tab.dart';
import 'package:admin_vce/screens/search_book/recomendation/recomendation_tab.dart';
import 'package:admin_vce/screens/search_book/trending_tab/trending_tab.dart';
import 'package:admin_vce/widget/custom_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:positioned_tap_detector/positioned_tap_detector.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:badges/badges.dart';

class SearchBook extends StatefulWidget {
  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> with TickerProviderStateMixin {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController search_controller;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();
    print(jsonStringData);
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

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("New"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Trending"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Recomendation"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: myTabs.length, vsync: this);
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
          return false;
        },
        child: Container(
          color: AppColors.primaryBackgroundColor,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "E-VCE",
                  style: TextStyle(color: AppColors.appBarTitle),
                ),
                actions: [
                  Badge(
                    position: BadgePosition.topEnd(top: 3, end: 18),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeColor: AppColors.badgecolor,
                    badgeContent: Text(
                      (general_issue_cart!.length + bookbank_issue_cart!.length)
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(right: 30.0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DisplayIssueCart()));
                        }),
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              floatingActionButton: SpeedDial(
                  icon: Icons.add,
                  backgroundColor: AppColors.floatingActionButtonColor,
                  overlayColor: Colors.white,
                  overlayOpacity: 0.4,
                  spaceBetweenChildren: 10,
                  spacing: 10,
                  children: [
                    SpeedDialChild(
                      child: Icon(Icons.add),
                      label: "Add Book",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (((context) => EnterISBN()))));
                      },
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.add),
                      label: "Issue Book",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (((context) => ItemIssue()))));
                      },
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.add),
                      label: "Collect Book",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (((context) => CollectItem()))));
                      },
                    ),
                  ]),
              backgroundColor: Colors.transparent,
              drawer: NavigationDrawer(),
              body: FutureBuilder(
                future: fetchTop10(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 25, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Hi, Shreesh',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white60,
                                    )),
                                Text('Discover Book',
                                    style: GoogleFonts.openSans(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(235, 255, 255, 255),
                                    ))
                              ],
                            )),
                        Autocomplete(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            } else {
                              return autoCompleteData.where((word) => word
                                  .toLowerCase()
                                  .contains(
                                      textEditingValue.text.toLowerCase()));
                            }
                          },
                          optionsViewBuilder:
                              (context, Function(String) onSelected, options) {
                            return Card(
                              margin: EdgeInsets.only(
                                  right: 30, top: 5, bottom: 400),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.only(),
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);

                                  return ListTile(
                                    // title: Text(option.toString()),
                                    title: SubstringHighlight(
                                      text: option.toString(),
                                      term: search_controller.text,
                                      textStyleHighlight: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onTap: () {
                                      onSelected(option.toString());
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: options.length,
                              ),
                            );
                          },
                          onSelected: (selectedString) {
                            print(selectedString);
                          },
                          fieldViewBuilder: (context, controller, focusNode,
                              onEditingComplete) {
                            search_controller = controller;

                            return Container(
                              height: 39,
                              margin:
                                  EdgeInsets.only(left: 18, right: 25, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white70,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  TextField(
                                    controller: search_controller,
                                    style: GoogleFonts.openSans(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 19, right: 50, bottom: 10),
                                        border: InputBorder.none,
                                        hintText: 'Search book..',
                                        hintStyle: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 9,
                                    child: PositionedTapDetector(
                                      onTap: (position) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) => ItemList(
                                                    keyword:
                                                        search_controller.text,
                                                    search_type: "tag",
                                                  ))),
                                        );
                                      },
                                      child: Icon(Icons.search_outlined),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        Container(
                            decoration: BoxDecoration(
                              color: AppColors.layerColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(right: 10, left: 10),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            height: 200,
                            child: ListView.builder(
                                itemCount: scrollDisplay.length,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (() {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => DisplayBook(
                                                  popularBookModel:
                                                      scrollDisplay[index] ??
                                                          Book(
                                                              author_name:
                                                                  "author_name",
                                                              book_name:
                                                                  "book_name",
                                                              isbn: "isbn"),
                                                ))),
                                      );
                                    }),
                                    child: Container(
                                        height: 180,
                                        width: 122,
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  scrollDisplay[index]!
                                                          .image_address ??
                                                      ""),
                                              fit: BoxFit.fill,
                                            ))),
                                  );
                                })),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 24),
                          child: Text("Monthly Top 10",
                              style: GoogleFonts.openSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(235, 255, 255, 255),
                              )),
                        ),
                        Container(
                          height: 25,
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.only(left: 25),
                          child: DefaultTabController(
                            length: myTabs.length,
                            child: TabBar(
                              controller: _tabController,
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              isScrollable: true,
                              labelColor: AppColors.selectedIndicatorLabelColor,
                              unselectedLabelColor:
                                  AppColors.unselectedIndicatorLabelColor,
                              labelStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              indicator: RoundedRectangleTabIndicator(
                                  weight: 2,
                                  width: 10,
                                  color: AppColors.IndicatorLineColor),
                              unselectedLabelStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              tabs: myTabs,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.layerColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: inNewTab.length * 125,
                          child:
                              TabBarView(controller: _tabController, children: [
                            NewTab(),
                            TrendingTab(),
                            RecomendationTab(),
                          ]),
                        )
                      ],
                    );
                  }
                  //  else if (snapshot.connectionState ==
                  //     ConnectionState.waiting) {
                  //   return Center(child: Text("wait"));
                  // }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )),
        ));
  }
}
