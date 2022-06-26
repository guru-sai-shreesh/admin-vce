import 'dart:convert';
import 'dart:io';

import 'package:admin_vce/model/personal_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

// import 'package:substring_highlight/substring_highlight.dart';

File file = File("your initial file");

class AddSubscription extends StatefulWidget {
  const AddSubscription({Key? key}) : super(key: key);

  @override
  State<AddSubscription> createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController Subscription_name_controller =
      TextEditingController();
  late TextEditingController provider_controller = TextEditingController();
  late TextEditingController image_url_controller = TextEditingController();
  late TextEditingController credentials_controller = TextEditingController();
  late TextEditingController published_date_controller =
      TextEditingController();
  late TextEditingController relevance_controller = TextEditingController();
  late TextEditingController popular_publication_controller =
      TextEditingController();
  late TextEditingController subscription_url_controller =
      TextEditingController();
  late TextEditingController prize_controller = TextEditingController();
  late TextEditingController location_controller = TextEditingController();
  late TextEditingController tags_controller = TextEditingController();
  late TextEditingController language_controller = TextEditingController();
  late TextEditingController acquisition_date_controller =
      TextEditingController();
  late TextEditingController description_controller = TextEditingController();

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

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
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, bottom: 25, right: 30),
        height: 49,
        color: Colors.transparent,
        child: FlatButton(
          color: Color.fromARGB(255, 17, 149, 189),
          onPressed: (() {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => AddSubscription()));
          }),
          minWidth: 100,
          child: Text("Save Subscription",
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Add Subscription",
                            style: GoogleFonts.openSans(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 32, 32, 32),
                            )),
                      ),
                      TextField(
                        controller: Subscription_name_controller,
                        decoration: InputDecoration(
                          label: Text("Subscription Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Subscription Name",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: provider_controller,
                        decoration: InputDecoration(
                          label: Text("Provider"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Provider",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: image_url_controller,
                        decoration: InputDecoration(
                          label: Text("Image URL"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Image URL",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      FlatButton(
                        color: Color.fromARGB(255, 19, 136, 171),
                        onPressed: (() async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            file = File(result.files.single.path ?? "");
                          } else {
                            // User canceled the picker
                          }
                        }),
                        height: 40,
                        minWidth: 100,
                        child: Text("Upload Credentials Excel",
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            )),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: published_date_controller,
                        decoration: InputDecoration(
                          label: Text("Published Date"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Published Date",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: relevance_controller,
                        decoration: InputDecoration(
                          label: Text("Relevance"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Relevance",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: popular_publication_controller,
                        decoration: InputDecoration(
                          label: Text("Popular Publications"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Popular Publications Isbn's",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: subscription_url_controller,
                        decoration: InputDecoration(
                          label: Text("Subscription Url"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Subscription Url",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: tags_controller,
                        decoration: InputDecoration(
                          label: Text("Tags"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Tags",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: acquisition_date_controller,
                        decoration: InputDecoration(
                          label: Text("Aquisition Date"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Acquisition Date",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: description_controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        decoration: InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          hintText: "Enter Description",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
