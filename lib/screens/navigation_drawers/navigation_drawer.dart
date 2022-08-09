import 'package:admin_vce/model/book_model.dart';
import 'package:admin_vce/model/fetchtop10.dart';
import 'package:admin_vce/screens/auth_screens/login_screen.dart';
import 'package:admin_vce/screens/books_issued/books_issued.dart';
import 'package:admin_vce/screens/dashboard/homescreen.dart';
import 'package:admin_vce/screens/e_subscriptions/e_subscriptions.dart';
import 'package:admin_vce/screens/exam_papers/exam_parers.dart';
import 'package:admin_vce/screens/grades/grades.dart';
import 'package:admin_vce/screens/liked.dart';
import 'package:admin_vce/screens/my_attendence/my_attendence.dart';
import 'package:admin_vce/screens/projects/projects.dart';
import 'package:admin_vce/screens/resources.dart';
import 'package:admin_vce/screens/saved/saved.dart';
import 'package:admin_vce/screens/schedule.dart';
import 'package:admin_vce/screens/search_book/search_book.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.cyan[900],
              foregroundImage: AssetImage('assets/images/profile.jpg'),
              child: Text("G"),
            ),
            accountName: Text("Tirumalla Guru sai shreeesh"),
            accountEmail: Text("guru.sai.shreesh@gmail.com"),
          ),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.dashboard_customize_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/homescreen"),
                  builder: (context) => HomeScreen(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("E-Subscriptions"),
            leading: Icon(Icons.subscriptions_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/e_subscriptions"),
                  builder: (context) => ESubscriptions(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Search Books"),
            leading: Icon(Icons.search_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/search_book"),
                  builder: (context) => SearchBook(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Issued Books"),
            leading: Icon(Icons.search_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/issued_book"),
                  builder: (context) => BooksIssued(),
                ),
              )
            },
          ),
          Divider(),
          ListTile(
            title: Text("Schedule"),
            leading: Icon(Icons.calendar_month_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/schedule"),
                  builder: (context) => Schedule(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Resources"),
            leading: Icon(Icons.video_library_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/resorces"),
                  builder: (context) => Resources(),
                ),
              )
            },
          ),
          Divider(),
          ListTile(
            title: Text("Saved"),
            leading: Icon(Icons.bookmark_outline_rounded),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/saved"),
                  builder: (context) => Saved(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Liked"),
            leading: Icon(Icons.favorite_border),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/liked"),
                  builder: (context) => Liked(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Projects"),
            leading: Icon(Icons.book_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/projects"),
                  builder: (context) => Projects(),
                ),
              )
            },
          ),
          ListTile(
            title: Text("Exam Papers"),
            leading: Icon(Icons.book_outlined),
            onTap: () => {
              Navigator.of(context).popUntil(ModalRoute.withName("/")),
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: "/exam_papers"),
                  builder: (context) => ExamPapers(),
                ),
              )
            },
          ),
          Divider(),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
