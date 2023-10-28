import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/Models/UserModel.dart';

class FireBaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromjson(snapshot.data()!),
            toFirestore: (value, _) => value.tojson());
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromjson(snapshot.data()!),
            toFirestore: (value, _) => value.tojson());
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docref = collection.doc();
    taskModel.Id = docref.id;
    return docref.set(taskModel);
  }

  static Future<void> addUserTofireStore(UserModel userModel) {
    var collection = getUserCollection();
    var docref = collection.doc(userModel.id);
    return docref.set(userModel);
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static void UpdateTask(TaskModel task) {
    getTaskCollection().doc(task.Id).update(task.tojson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTaskCollection()
        .where("UserId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> CreateUser(
      String email,
      String Password,
      Function OnSucsses,
      Function Onerror,
      String Fname,
      String Lname,
      String Email) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: Password,
      );
      if (credential.user?.uid != null) {
        UserModel userModel = UserModel(
            Fname: Fname, Lname: Lname, Email: Email, id: credential.user!.uid);
        addUserTofireStore(userModel).then((value) {
          OnSucsses();
        });
      }
    } on FirebaseAuthException catch (e) {
      Onerror(e.message);
    }
  }

  static Future<void> Login(String email, String Password, Function OnSuccess,
      Function ONerror) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: Password);

      if (credential.user?.uid != null) {

        OnSuccess();
      }
    } on FirebaseAuthException catch (e) {
      ONerror('Wrong email or password');
    }
  }


  static Future<UserModel?> readUserFromFirestore(String id)
  async{
    DocumentSnapshot<UserModel> doc = await getUserCollection().doc(id).get();
   return doc.data();
  }

  // static passwordreset(String email)
  // {
  //   FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  // }
}
