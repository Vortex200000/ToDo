import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/UserModel.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';

class MyProvider extends ChangeNotifier {
  UserModel? usermodel;
  User? firebaseuser;

  MyProvider() {
    firebaseuser = FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      inituser();
    }
  }

  inituser() async {

    firebaseuser = FirebaseAuth.instance.currentUser;
    usermodel =
        await FireBaseFunctions.readUserFromFirestore(firebaseuser!.uid);
    notifyListeners();
  }
}
