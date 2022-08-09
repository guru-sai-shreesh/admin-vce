import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/e_subscriptions/display_subscription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedSubscriptions extends StatefulWidget {
  @override
  State<SavedSubscriptions> createState() => _SavedSubscriptionsState();
}

class _SavedSubscriptionsState extends State<SavedSubscriptions> {
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
                child: Text("Saved Subscriptions",
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
                  itemCount: saved_subscriptions!.length,
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
                                      builder: ((context) =>
                                          DisplaySubscription(
                                              popularSubscriptionModel:
                                                  saved_subscriptions![
                                                      index]))),
                                );
                              }),
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.width - 50) *
                                        0.4,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25.0),
                                        topLeft: Radius.circular(25.0),
                                        bottomRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(saved_subscriptions![
                                                    index]
                                                .image_address ??
                                            "https://www.acm.org/binaries/content/gallery/acm/ctas/publications/digital-library-logo.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Container(
                                // margin: EdgeInsets.only(right: 35),
                                padding: EdgeInsets.only(
                                    left: 15, top: 10, right: 15),
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
                                padding: EdgeInsets.only(
                                    left: 15, top: 2, right: 15),
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
                                        text:
                                            'Computer Science, Information Technology',
                                      ),
                                    ],
                                  ),
                                )),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  decoration: BoxDecoration(),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              width: 2.0, color: Colors.white)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              35)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                DisplaySubscription(
                                                  popularSubscriptionModel:
                                                      saved_subscriptions![
                                                          index],
                                                ))),
                                      );
                                    },
                                    child: Text(
                                      "Open " +
                                          saved_subscriptions![index]
                                              .subscription_name,
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.ButtonTextColor),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (saved_subscriptions!.contains(
                                          saved_subscriptions![index])) {
                                        saved_books!.remove(
                                            saved_subscriptions![index]);
                                      } else {
                                        saved_subscriptions!
                                            .add(saved_subscriptions![index]);
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 12, bottom: 8),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (saved_subscriptions!.contains(
                                              saved_subscriptions![index])) {
                                            saved_subscriptions!.remove(
                                                saved_subscriptions![index]);
                                          } else {
                                            saved_subscriptions!.add(
                                                saved_subscriptions![index]);
                                          }
                                        });
                                      },
                                      child: Icon(
                                        saved_subscriptions!.contains(
                                                saved_subscriptions![index])
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        color: saved_subscriptions!.contains(
                                                saved_subscriptions![index])
                                            ? Colors.grey
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
