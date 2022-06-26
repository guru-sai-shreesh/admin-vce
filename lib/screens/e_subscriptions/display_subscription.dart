import 'package:admin_vce/model/colors.dart';
import 'package:admin_vce/model/subscription_model.dart';
import 'package:admin_vce/widget/custom_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplaySubscription extends StatefulWidget {
  final Subscription popularSubscriptionModel;
  const DisplaySubscription({Key? key, required this.popularSubscriptionModel})
      : super(key: key);

  @override
  State<DisplaySubscription> createState() =>
      _DisplaySubscriptionState(popularSubscriptionModel);
}

class _DisplaySubscriptionState extends State<DisplaySubscription>
    with TickerProviderStateMixin {
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
        child: Text("Relevance and Credentials"),
      ),
    ),
    Tab(
      child: Container(
        margin: EdgeInsets.only(right: 23),
        child: Text("Popular Publications"),
      ),
    ),
  ];

  final Subscription popularSubscriptionModel;
  bool saveClicked = false;

  _DisplaySubscriptionState(this.popularSubscriptionModel);

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, bottom: 14),
            height: 42,
            color: Colors.transparent,
            child: FlatButton(
              color: AppColors.primaryColor,
              onPressed: (() {
                onTap:
                setState(() {
                  if (saveClicked) {
                    saveClicked = false;
                  } else {
                    saveClicked = true;
                  }
                });
              }),
              minWidth: 20,
              child: Icon(
                saveClicked
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_outline_rounded,
                color: Colors.white,
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
              onPressed: (() {
                onTap:
                setState(() {});
              }),
              minWidth: MediaQuery.of(context).size.width - 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Open Subscription",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.primaryBackgroundColor,
        child: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: AppColors.primaryBackgroundColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Stack(
                  children: [
                    Align(
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(popularSubscriptionModel
                                    .image_address ??
                                "https://www.acm.org/binaries/content/gallery/acm/ctas/publications/digital-library-logo.jpg"),
                            fit: BoxFit.fill,
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
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              popularSubscriptionModel.provider,
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
                              popularSubscriptionModel.subscription_name,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
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
                        height: 700,
                        child:
                            TabBarView(controller: _tabController, children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25, right: 25),
                            child: Text(popularSubscriptionModel.description ??
                                "No Description"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text('Relevenace and Credentials'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text('Popular Publications'),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ]))
          ],
        )),
      ),
    );
  }
}
