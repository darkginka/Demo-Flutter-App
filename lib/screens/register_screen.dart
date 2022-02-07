import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  final RegExp _regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _repasswordTextController =
      TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Login')),
          ),
          Column(
            children: [
              SizedBox(
                width: 300,
                height: 500,
                child: RegisterForm(
                  formKey: _formKey,
                  emailTextController: _emailTextController,
                  passwordTextController: _passwordTextController,
                  repasswordTextController: _repasswordTextController,
                  regex: _regex,
                ),
              ),
            ],
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.black12,
              )),
        ],
      ),
    );
  }
}
