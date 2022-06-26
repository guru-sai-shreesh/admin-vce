import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/model/project_model.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/screens/projects/display_project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProjectTab extends StatefulWidget {
  const NewProjectTab({Key? key}) : super(key: key);

  @override
  State<NewProjectTab> createState() => _NewProjectTabState();
}

class _NewProjectTabState extends State<NewProjectTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: inProjectNewTab.length,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => DisplayProject(
                                      popularProjectModel:
                                          inProjectNewTab[index] ??
                                              Project(
                                                  student_name: "student_name",
                                                  project_name: "project_name"),
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
                                    inProjectNewTab[index]!.project_name,
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    inProjectNewTab[index]!.student_name,
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
                                if (liked_projects!
                                    .contains(inProjectNewTab[index])) {
                                  liked_projects!
                                      .remove(inProjectNewTab[index]);
                                } else {
                                  liked_projects!.add(inProjectNewTab[index] ??
                                      Project(
                                          student_name: "student_name",
                                          project_name: "project_name"));
                                }
                              });
                            },
                            child: Icon(
                              liked_projects!.contains(inProjectNewTab[index])
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: liked_projects!
                                      .contains(inProjectNewTab[index])
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
                            builder: ((context) => DisplayProject(
                                  popularProjectModel: inProjectNewTab[index] ??
                                      Project(
                                          student_name: "student_name",
                                          project_name: "project_name"),
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
                                  inProjectNewTab[index]!.image_address ?? ""),
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
