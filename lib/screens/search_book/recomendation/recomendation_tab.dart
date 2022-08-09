import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/screens/items_list.dart';
import 'package:admin_vce/screens/search_book/recomendation/add_categeory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../display_book.dart';

List<String> categeory = [
  "Computer Science",
  "Electronic",
  "Information Technology",
  "Mechanical",
  "Civil",
  "Other"
];

class RecomendationTab extends StatefulWidget {
  const RecomendationTab({Key? key}) : super(key: key);

  @override
  State<RecomendationTab> createState() => _RecomendationTabState();
}

class _RecomendationTabState extends State<RecomendationTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 15, right: 20, bottom: 5),
          height: 60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ],
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
              color: AppColors.badgecolor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text("Categeories",
                  style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddCategeory()));
                },
                icon: Icon(Icons.add),
                color: Colors.white,
              )
            ],
          ),
        ),
        ListView.builder(
            padding: EdgeInsets.only(top: 5, left: 15, right: 15),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categeory.length,
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => ItemList(
                                keyword: categeory[index], search_type: "cat")),
                          ));
                        }),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        categeory[index],
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
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
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) => ItemList(
                                    keyword: categeory[index],
                                    search_type: "cat"))),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
