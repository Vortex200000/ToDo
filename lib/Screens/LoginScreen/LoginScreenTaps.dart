import 'package:flutter/material.dart';
import 'package:todo/Screens/LoginScreen/Login.dart';
import 'package:todo/Screens/LoginScreen/SignUp.dart';
import 'package:todo/Styles/Mythemes.dart';

class LoginSceenTaps extends StatefulWidget {
  // const LoginSceenTaps({super.key});
  static const String routeName = "LoginScreen";



  @override
  State<LoginSceenTaps> createState() => _LoginSceenTapsState();
}

class _LoginSceenTapsState extends State<LoginSceenTaps> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Mythemes.brimaryColour,
          bottom: TabBar(
            indicatorColor: Colors.white,
              tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Login'), Icon(Icons.login)],
              ),
            ),
            Tab(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('SignUp'), Icon(Icons.app_registration)],
            )),
          ]),
        ),
        body: TabBarView(
          children: [
       Login(),
            SignUp(),
          ],
        ),
      ),
    );
  }

}
