import 'dart:convert';

import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/personal_data.dart';
import 'package:admin_vce/screens/search_book/recomendation/recomendation_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AddCategeory extends StatefulWidget {
  const AddCategeory({Key? key}) : super(key: key);

  @override
  State<AddCategeory> createState() => _AddCategeoryState();
}

class _AddCategeoryState extends State<AddCategeory> {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController controller;

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
            Navigator.of(context).pop();
            setState(() {
              categeory.insert(categeory.length - 1, controller.text);
            });
          }),
          minWidth: 100,
          child: Text("Add Categeory",
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
                        child: Text("Add Categeory",
                            style: GoogleFonts.openSans(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 32, 32, 32),
                            )),
                      ),
                      Autocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          } else {
                            return autoCompleteData.where((word) => word
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()));
                          }
                        },
                        optionsViewBuilder:
                            (context, Function(String) onSelected, options) {
                          return Card(
                            margin:
                                EdgeInsets.only(right: 30, top: 5, bottom: 400),
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
                                    term: controller.text,
                                    textStyleHighlight:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                          this.controller = controller;

                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            onEditingComplete: onEditingComplete,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              hintText: "Enter Categeory Name",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
