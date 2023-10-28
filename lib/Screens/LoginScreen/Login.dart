import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/Layout/home_layout.dart';
import 'package:todo/Screens/LoginScreen/LoginScreenTaps.dart';
import 'package:todo/Screens/LoginScreen/Reset_email_password.dart';
import 'package:todo/Screens/LoginScreen/SignUp.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';
import 'package:todo/Styles/Mythemes.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // const Login({super.key});
  var emailControlleer = TextEditingController();

  var passwordcontroller = TextEditingController();

  var logkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: logkey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                  child: Text(
                'Enter your email and password to view your tasks',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.w100),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: emailControlleer,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Please enter your email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your password';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Please enter your password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (logkey.currentState!.validate()) {
                      FireBaseFunctions.Login(
                          emailControlleer.text, passwordcontroller.text, () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Home.routeName, (route) => false);
                      }, (message) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(message),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'))
                                ],
                              );
                            });
                      });
                    }
                  },
                  child: Text('Login')),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                          // Navigator.pushNamed(context, ResetPassword.routeName);
                      },
                      child: Text(
                        'Forget your password ?',

                      )),
                  Text(
                    'Dont have an account ? create one now',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Mythemes.brimaryColour),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
