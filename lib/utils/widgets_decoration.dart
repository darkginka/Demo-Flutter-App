import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailto/mailto.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Widgets {
  static tabBar(
    String title,
    List<Tab> tabs,
    List<Widget> children,
  ) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: tabs,
          ),
          elevation: 20,
          titleSpacing: 10,
        ),
        body: TabBarView(children: children),
      ),
    );
  }

  static AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      //automaticallyImplyLeading: false,
      title: Center(
          child: Text('$title', style: const TextStyle(color: Colors.amber))),
    );
  }

  static navBar() {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          Widgets.userInfo(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Request'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  static BottomNavigationBar bottomBar(Function(int)? onPressed, int integer) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user),
          label: 'User',
        ),
      ],
      currentIndex: integer,
      onTap: onPressed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.amber[800],
    );
  }

  static indicator(
    Color color,
    String text,
    bool isSquare,
  ) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }

  static userInfo() {
    return UserAccountsDrawerHeader(
      accountName: const Text('Rohan Thakur'),
      accountEmail: const Text('b4.rohan.com'),
      currentAccountPicture: CircleAvatar(
        child: CircleAvatar(
          child: Image.network(
            'https://avatars.githubusercontent.com/u/31396751?v=4',
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                'https://image.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg')),
      ),
    );
  }

  static launchMailto() async {
    final mailtoLink = Mailto(
      to: ['to@example.com'],
      cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'mailto example subject',
      body: 'mailto example body',
    );
    await launch('$mailtoLink');
  }

  static buildInputDeoration(String label, String hint, Widget icon) {
    return InputDecoration(
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red)),
        icon: icon,
        labelText: label,
        hintText: hint);
  }

  static contactBtn(String? btnsend, Widget icon, Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextButton.icon(
          style: TextButton.styleFrom(
              backgroundColor: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          onPressed: onPressed,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
          label: Text(
            "$btnsend",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }

  static Widget buildBtn(String? btnsend, Function()? onPressed) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
          child: Text("$btnsend"),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.blue),
            ),
            primary: Colors.blue,
          ),
          onPressed: onPressed),
    );
  }

  static Widget homeBtn(String? btnName, Function()? onpress) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 180,
        child: ElevatedButton(
          onPressed: onpress,
          child: Text('$btnName'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onSurface: Colors.black,
          ),
        ),
      ),
    );
  }

  static Widget socialBtn() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: const Color(0XFFFBEFD9),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    launch("https://facebook.com");
                  },
                  icon: Image.asset(
                    'assets/social/facebook.png',
                    height: 25,
                    width: 25,
                  ),
                  label: const Text('')),
              TextButton.icon(
                  onPressed: () {
                    launch("https://instagram.com");
                  },
                  icon: Image.asset(
                    'assets/social/instagram.png',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text('')),
              TextButton.icon(
                  onPressed: () {
                    launch("https://twitter.com");
                  },
                  icon: Image.asset(
                    'assets/social/twitter.png',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text(''))
            ],
          ),
        )
      ],
    );
  }

  static void zoomDialog(BuildContext context, image) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: PhotoView(
              tightMode: true,
              imageProvider: FileImage(image),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          );
        },
      );

  static void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  static showDialogFunc(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Failed to Pick Image "),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  static showToastFunc(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

    // static void zoomDialog(BuildContext context, image) => showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           child: PhotoView(
  //             tightMode: true,
  //             imageProvider: FileImage(image),
  //             heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
  //           ),
  //         );
  //       },
  //     );
  
  static showCardFunc(context, image, title, desc) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              height: 310,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      image,
                      width: 200,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
