import 'dart:convert';

import 'package:admin_vce/model/personal_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:substring_highlight/substring_highlight.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController book_name_controller = TextEditingController();
  late TextEditingController author_name_controller = TextEditingController();
  late TextEditingController image_url_controller = TextEditingController();
  late TextEditingController publisher_name_controller =
      TextEditingController();
  late TextEditingController published_date_controller =
      TextEditingController();
  late TextEditingController edition_controller = TextEditingController();
  late TextEditingController accesion_number_controller =
      TextEditingController();
  late TextEditingController page_count_controller = TextEditingController();
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
    if (present_adding_book != null) {
      book_name_controller.text = present_adding_book!.book_name;
      author_name_controller.text = present_adding_book!.author_name;
      image_url_controller.text = present_adding_book!.image_address!;
      publisher_name_controller.text = present_adding_book!.publisher!;
      description_controller.text = present_adding_book!.description!;
      present_adding_book = null;
    }

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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddBook()));
          }),
          minWidth: 100,
          child: Text("Save Book",
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
                        child: Text("Add Book",
                            style: GoogleFonts.openSans(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 32, 32, 32),
                            )),
                      ),
                      TextField(
                        controller: book_name_controller,
                        decoration: InputDecoration(
                          label: Text("Book Name"),
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
                          hintText: "Enter Book Name",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: author_name_controller,
                        decoration: InputDecoration(
                          label: Text("Author Name"),
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
                          hintText: "Enter Author Name",
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
                      TextField(
                        controller: publisher_name_controller,
                        decoration: InputDecoration(
                          label: Text("Publisher Name"),
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
                          hintText: "Enter Publisher Name",
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
                        controller: edition_controller,
                        decoration: InputDecoration(
                          label: Text("Edition"),
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
                          hintText: "Enter Edition",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: accesion_number_controller,
                        decoration: InputDecoration(
                          label: Text("Accesion number"),
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
                          hintText: "Enter Accesion Number",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: page_count_controller,
                        decoration: InputDecoration(
                          label: Text("Page count"),
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
                          hintText: "Enter Page Count",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: prize_controller,
                        decoration: InputDecoration(
                          label: Text("Prize"),
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
                          hintText: "Enter Prize",
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        controller: location_controller,
                        decoration: InputDecoration(
                          label: Text("Location"),
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
                          hintText: "Enter Location",
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
                        controller: language_controller,
                        decoration: InputDecoration(
                          label: Text("Language"),
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
                          hintText: "Enter Language",
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
