import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shift_screens/home_screen.dart';
import 'package:flutter_application_1/utils/widgets_decoration.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Sign In", style: Theme.of(context).textTheme.headline4),
            const Text("Login here"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please add email';
                  }
                },
                controller: _emailTextController,
                decoration: Widgets.buildInputDeoration('Enter email',
                    'john@me.co', const Icon(Icons.account_box_rounded)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter password';
                  }
                },
                obscureText: true,
                controller: _passwordTextController,
                decoration: Widgets.buildInputDeoration(
                    'Enter password', 'Pass123@@', const Icon(Icons.lock)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  backgroundColor: Colors.amber,
                  primary: Colors.black,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  )),
              child: const Text('Sigh In'),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   if (_emailTextController.text == 'admin' &&
                //       _passwordTextController.text == 'admin') {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const HomePage()));
                //   }
                // }
              },
            )
          ],
        ));
  }
}
