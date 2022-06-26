import 'dart:convert';
import 'package:http/http.dart' as http;

class Book {
  late String book_name;
  late String author_name;
  late String? publisher;
  late String? description;
  late int? quantity;
  late String? location;
  late String? image_address;
  late bool? isPhysicalBook;
  late bool? isEBook;
  late String isbn;
  late String? edition;
  late int? no_of_pages;
  late List<String>? relavence;
  Book({
    required this.author_name,
    required this.book_name,
    this.no_of_pages,
    this.edition,
    this.description,
    this.relavence,
    this.isPhysicalBook,
    this.isEBook,
    this.image_address,
    this.publisher,
    this.location,
    this.quantity,
    required this.isbn,
  });

  static Future<Book?> getBooks(String isbn) async {
    var url = 'https://www.googleapis.com/books/v1/volumes?q=isbn:' + isbn;
    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      var parsedJsontemp = json.decode(result.body);
      var parsedJson = parsedJsontemp['items'][0];
      final String title = parsedJson['volumeInfo']['title'];
      String authors = (parsedJson['volumeInfo']['authors'] == null)
          ? ''
          : parsedJson['volumeInfo']['authors'].toString();
      authors = authors.replaceAll('[', '');
      authors = authors.replaceAll(']', '');
      final String description =
          (parsedJson['volumeInfo']['description'] == null)
              ? ''
              : parsedJson['volumeInfo']['description'];
      final String publisher = (parsedJson['volumeInfo']['publisher'] == null)
          ? ''
          : parsedJson['volumeInfo']['publisher'];

      String thumbnail =
          "https://edit.org/images/cat/book-covers-big-2019101610.jpg";
      try {
        thumbnail =
            (parsedJson['volumeInfo']['imageLinks']['thumbnail'] == null)
                ? 'assets/images/book_cover.jpg'
                : parsedJson['volumeInfo']['imageLinks']['thumbnail'];
      } catch (err) {}
      return Book(
        isbn: isbn,
        book_name: title,
        author_name: authors,
        description: description,
        publisher: publisher,
        image_address: thumbnail,
      );
    } else {
      return null;
    }
  }
}

class IssuedBook extends Book {
  late String issueDate;
  late String dueDate;
  late String accesionNumber;
  IssuedBook(
      {required author_name,
      required book_name,
      required isbn,
      required this.issueDate,
      required this.dueDate,
      required this.accesionNumber})
      : super(author_name: author_name, book_name: book_name, isbn: isbn);
}
