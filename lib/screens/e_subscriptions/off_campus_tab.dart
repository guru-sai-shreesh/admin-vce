import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/subscription_model.dart';
import 'package:admin_vce/model/subscritions_list.dart';
import 'package:admin_vce/screens/e_subscriptions/display_subscription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffCampusTab extends StatefulWidget {
  const OffCampusTab({Key? key}) : super(key: key);

  @override
  State<OffCampusTab> createState() => _OffCampusTabState();
}

class _OffCampusTabState extends State<OffCampusTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: offCampusSubsList.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.cardcolor,
            elevation: 10,
            margin: EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              height: (MediaQuery.of(context).size.width) * 0.65,
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: ((context) => DisplaySubscription(
                                popularSubscriptionModel:
                                    offCampusSubsList[index]))),
                      );
                    }),
                    child: Container(
                      height: (MediaQuery.of(context).size.width - 50) * 0.4,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0),
                              topLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(offCampusSubsList[index]
                                      .image_address ??
                                  "https://www.acm.org/binaries/content/gallery/acm/ctas/publications/digital-library-logo.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Container(
                      // margin: EdgeInsets.only(right: 35),
                      padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 11.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Number of Publications: ',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '92908',
                            ),
                          ],
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 15, top: 2, right: 15),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 11.5,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Relavence: ',
                              style: TextStyle(
                                  fontSize: 11.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: 'Computer Science, Information Technology',
                            ),
                          ],
                        ),
                      )),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    decoration: BoxDecoration(),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(width: 2.0, color: Colors.white)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width - 80, 35)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => DisplaySubscription(
                                    popularSubscriptionModel:
                                        offCampusSubsList[index],
                                  ))),
                        );
                      },
                      child: Text(
                        "Open " + offCampusSubsList[index].subscription_name,
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.ButtonTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
