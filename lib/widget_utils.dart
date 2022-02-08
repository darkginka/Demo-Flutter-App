import 'dart:io';
import 'package:crusher_support/screens/forgot_password_page.dart';
import 'package:crusher_support/screens/home_page.dart';
import 'package:crusher_support/screens/login_page.dart';
import 'package:crusher_support/screens/profile_page.dart';
import 'package:crusher_support/screens/request_screens/record_table_page.dart';
import 'package:crusher_support/screens/update_cache_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilsWidgets {
  static AppBar buildAppBar(String title) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.blue),
        ));
  }

  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            child: Image.asset('assets/images/company_logo.png'),
            color: Colors.blue,
            height: 180,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
          ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Records'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecordsTableScreen()));
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.cached),
              title: const Text('Update Cache'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateCache()));
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Log Out'),
            onTap: () async {
              final pref = await SharedPreferences.getInstance();
              pref.remove("token");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.change_circle),
            title: const Text('Change Password'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen()));
            },
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

  static Widget buildSqureBtn(String? btnName, Function()? onpress) {
    return Center(
      child: ElevatedButton(
        onPressed: onpress,
        child: Text('$btnName'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onSurface: Colors.black,
        ),
      ),
    );
  }

  static Widget buildRoundBtn(String? btnsend, Function()? onPressed) {
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

  static Widget buildIconBtn(
      String? btnsend, Widget icon, Function()? onPressed) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            shadowColor: Colors.black,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        onPressed: onPressed,
        icon: icon,
        label: Text(
          "$btnsend",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  static Widget textFormField(String? labelText, String hintText,
      String? Function(String?)? validator, TextEditingController? controller,
      {bool isReadOnly = false,
      TextInputType textInputType = TextInputType.text,
      bool obscure = false,
      int maxLine = 1,
      Widget? icon,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Key? key,
      bool isLoginForm = false,
      String? Function(String)? onChanged,
      List<TextInputFormatter>? inputFormatter,
      TextInputAction textInputAction = TextInputAction.next}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
        child: TextFormField(
          onChanged: onChanged,
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              letterSpacing: 1),
          key: key,
          textInputAction: textInputAction,
          autofocus: false,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          controller: controller,
          validator: validator,
          obscureText: obscure,
          maxLines: maxLine,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            filled: isLoginForm ? true : null,
            fillColor: isLoginForm ? Color.fromARGB(50, 203, 219, 245) : null,
            enabledBorder: isLoginForm
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            icon: icon,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  static Widget dropDownButton(
      String? hint,
      String? label,
      String _dropDownValue,
      List<dynamic> dropDownItem,
      Function(dynamic)? onChange,
      {String? Function(String?)? validator,
      String? holder,
      Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Row(
        children: [
          widget ?? Text(""),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("$label")),
                value: holder,
                focusColor: Colors.transparent,
                isExpanded: true,
                hint: Text(
                  '$hint',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                items: dropDownItem
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
                validator: validator,
                onChanged: onChange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showDialogFuncWithAction(context, title, description,
      {Function()? onPressed}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(description)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('OK'),
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
}
