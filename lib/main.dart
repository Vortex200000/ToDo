import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Layout/home_layout.dart';
import 'package:todo/Provider/MyProvider.dart';
import 'package:todo/Screens/LoginScreen/LoginScreenTaps.dart';
import 'package:todo/Screens/LoginScreen/Reset_email_password.dart';
import 'package:todo/Screens/LoginScreen/SignUp.dart';
import 'package:todo/Styles/Mythemes.dart';
import 'package:todo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return MyProvider();
  },
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseuser != null
          ? Home.routeName
          : LoginSceenTaps.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        LoginSceenTaps.routeName: (context) => LoginSceenTaps(),
        SignUp.routeName: (context) => SignUp(),
        // ResetPassword.routeName:(context) => ResetPassword(),
      },
      theme: Mythemes.lightTheme,
    );
  }
}
