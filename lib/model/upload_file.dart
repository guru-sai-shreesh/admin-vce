import 'dart:convert';

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

Upload(File File, uploadURL) async {
  var stream = new http.ByteStream(DelegatingStream.typed(File.openRead()));
  var length = await File.length();
  var uri = Uri.parse(uploadURL);

  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(File.path));
  contentType:
  new MediaType('image', 'png');

  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
