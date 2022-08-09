import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/projects/display_project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedProjects extends StatefulWidget {
  @override
  State<SavedProjects> createState() => _SavedProjectsState();
}

class _SavedProjectsState extends State<SavedProjects> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 25),
                child: Text("Saved Projects",
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
                  itemCount: saved_projects!.length,
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
                                          builder: ((context) => DisplayProject(
                                                popularProjectModel:
                                                    saved_projects![index],
                                              )),
                                        ));
                                      }),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
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
                                              saved_projects![index]
                                                  .project_name,
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              saved_projects![index]
                                                  .student_name,
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
                                          if (saved_projects!.contains(
                                              saved_projects![index])) {
                                            saved_projects!
                                                .remove(saved_projects![index]);
                                          } else {
                                            saved_projects!
                                                .add(saved_projects![index]);
                                          }
                                        });
                                      },
                                      child: Icon(
                                        saved_projects!.contains(
                                                saved_projects![index])
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        color: saved_projects!.contains(
                                                saved_projects![index])
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
                                      builder: ((context) => DisplayProject(
                                            popularProjectModel:
                                                saved_projects![index],
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
                                            saved_projects![index]
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
    );
  }
}
