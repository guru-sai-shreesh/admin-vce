import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/project_model.dart';

late List<Book?> scrollDisplay = [];
late List<Book?> inNewTab = [];
late List<Book?> inTrendingTab = [];
late List<Project?> ProjectscrollDisplay = [
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png")
];
late List<Project?> inProjectNewTab = [
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png")
];
late List<Project?> inProjectTrendingTab = [
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png"),
  Project(
      student_name: "guru sai shreesh",
      project_name: "Vce Project",
      image_address:
          "https://www.cover-pages.com/wp-content/uploads/2018/01/cover-page-46.png")
];
bool _isLoaded = false;

fetchTop10() async {
  if (_isLoaded == false) {
    scrollDisplay = [
      await Book.getBooks("9781451648546"),
      await Book.getBooks("0199535566"),
      await Book.getBooks("0061964360"),
      await Book.getBooks("0553211404"),
      await Book.getBooks("0063056232"),
      await Book.getBooks("0141439572"),
    ];
    // scrollDisplay.add(await Book.getBooks("9781451648546"));
    // scrollDisplay.add(await Book.getBooks("0199535566"));
    // scrollDisplay.add(await Book.getBooks("0061964360"));
    // scrollDisplay.add(await Book.getBooks("0553211404"));
    // scrollDisplay.add(await Book.getBooks("0063056232"));
    // scrollDisplay.add(await Book.getBooks("0141439572"));

    inNewTab = [
      await Book.getBooks("0063138182"),
      await Book.getBooks("0141439580"),
      await Book.getBooks("0486280489"),
      await Book.getBooks("0141439564"),
      await Book.getBooks("9781451648546"),
      await Book.getBooks("0061964360"),
      await Book.getBooks("0593230485"),
      await Book.getBooks("0451499786"),
      await Book.getBooks("0553211404"),
      await Book.getBooks("1476716765"),
    ];
    // inNewTab.add(await Book.getBooks("0063138182"));
    // inNewTab.add(await Book.getBooks("0141439580"));
    // inNewTab.add(await Book.getBooks("0141439564"));
    // inNewTab.add(await Book.getBooks("0486280489"));
    // inNewTab.add(await Book.getBooks("0061964360"));
    // inNewTab.add(await Book.getBooks("0063056232"));
    // inNewTab.add(await Book.getBooks("0593230485"));
    // inNewTab.add(await Book.getBooks("0451499786"));
    // inNewTab.add(await Book.getBooks("0553211404"));
    // inNewTab.add(await Book.getBooks("1476716765"));

    inTrendingTab = [
      await Book.getBooks("1250229618"),
      await Book.getBooks("0385697376"),
      await Book.getBooks("0063138182"),
      await Book.getBooks("1250811783"),
      await Book.getBooks("0374185727"),
      await Book.getBooks("0061964360"),
      await Book.getBooks("0593420314"),
      await Book.getBooks("1677199954"),
      await Book.getBooks("0553211404"),
      await Book.getBooks("0141439572"),
    ];
    // inTrendingTab.add(await Book.getBooks("1250229618"));
    // inTrendingTab.add(await Book.getBooks("0385697376"));
    // inTrendingTab.add(await Book.getBooks("0063138182"));
    // inTrendingTab.add(await Book.getBooks("1250811783"));
    // inTrendingTab.add(await Book.getBooks("0374185727"));
    // inTrendingTab.add(await Book.getBooks("0593420314"));
    // inTrendingTab.add(await Book.getBooks("0061964360"));
    // inTrendingTab.add(await Book.getBooks("0553211404"));
    // inTrendingTab.add(await Book.getBooks("1677199954"));
    // inTrendingTab.add(await Book.getBooks("0141439572"));
    _isLoaded = true;
  }
  return null;
}

List<IssuedBook?> issuedBooks = [
  IssuedBook(
      author_name: "author_name",
      book_name: "book_name",
      isbn: "isbn",
      issueDate: "issueDate",
      dueDate: "dueDate",
      accesionNumber: "accesionNumber"),
  IssuedBook(
      author_name: "author_name",
      book_name: "book_name",
      isbn: "isbn",
      issueDate: "issueDate",
      dueDate: "dueDate",
      accesionNumber: "accesionNumber"),
  IssuedBook(
      author_name: "author_name",
      book_name: "book_name",
      isbn: "isbn",
      issueDate: "issueDate",
      dueDate: "dueDate",
      accesionNumber: "accesionNumber"),
  IssuedBook(
      author_name: "author_name",
      book_name: "book_name",
      isbn: "isbn",
      issueDate: "issueDate",
      dueDate: "dueDate",
      accesionNumber: "accesionNumber"),
];
