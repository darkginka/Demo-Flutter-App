import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/widgets_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Page'),
          actions: [
            TextButton.icon(
                onPressed: () {},
                icon: const CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/31396751?s=400&u=b0de4f4adbe7ba393509f9a46c3ddf83ff7ad36e&v=4'),
                ),
                label: const Text(
                  //'$_counter',
                  'Rohan',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ))
          ],
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(),
        ),
        bottomNavigationBar: Widgets.bottomBar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
