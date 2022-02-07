import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shift_screens/home_screen.dart';
import 'package:flutter_application_1/screens/shift_screens/list_screen.dart';
import 'package:flutter_application_1/screens/shift_screens/sortable_table_screen.dart';
import 'package:flutter_application_1/screens/shift_screens/start_screen.dart';
import 'package:flutter_application_1/screens/shift_screens/tabbar_screen.dart';
import 'package:flutter_application_1/screens/shift_screens/table_screen.dart';
import 'package:flutter_application_1/utils/widgets_decoration.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _DieselMainSreenState createState() => _DieselMainSreenState();
}

class _DieselMainSreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBar('Monitoring Screen'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Widgets.homeBtn('Home', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }),
          const SizedBox(
            height: 40,
          ),
          Widgets.homeBtn('Start', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StartPage()));
          }),
          const SizedBox(
            height: 40,
          ),
          Widgets.homeBtn('List', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListPage()));
          }),
          const SizedBox(
            height: 40,
          ),
          Widgets.homeBtn('Table', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TablePage()));
          }),
          const SizedBox(
            height: 40,
          ),
          Widgets.homeBtn('TabBar', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TabPageScreen()));
          }),
          const SizedBox(
            height: 40,
          ),
          Widgets.homeBtn('Sortable Table', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SortablePage()));
          }),
        ],
      ),
    );
  }
}
