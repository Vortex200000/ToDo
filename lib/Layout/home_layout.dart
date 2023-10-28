import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/Provider/MyProvider.dart';
import 'package:todo/Screens/LoginScreen/LoginScreenTaps.dart';
import 'package:todo/Screens/Settings/Settings_tap.dart';
import 'package:todo/Screens/Tasks/tasks_tap.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';
import 'package:todo/Styles/Mythemes.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  static const String routeName = "layout";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int index = 0;
  List<Widget> Taps = [];

  var SelectedDate = DateTime.now();
    var titleController = TextEditingController();
  var DescriptionController = TextEditingController();
   var valKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    Taps = [Tasks(), Settings()];

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('To Do List '),  //${provider.usermodel!.Fname}
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(

                onTap: () {
               FirebaseAuth.instance.signOut();
               Navigator.pushNamedAndRemoveUntil(context, LoginSceenTaps.routeName, (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Logout'),
                      SizedBox(width: 10,),
                      Icon(Icons.logout),
                    ],
                  ),
                ))
          )
        ],
        toolbarHeight: MediaQuery.of(context).size.height * .157,
        titleSpacing: 50,
      ),
      body: Taps[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return ShowNavButton();
        },
        backgroundColor: Mythemes.brimaryColour,
        child: Icon(
          Icons.add,
          size: 35,
        ),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5)),
        elevation: 10,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        elevation: 30,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 35,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_rounded,
                    size: 35,
                  ),
                  label: ""),
            ]),
      ),
    );
  }

  ShowNavButton() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent)),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            child: Form(
              key: valKey,
              child: Column(

                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add New Task',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      validator: (value) {  // value is the text we write in the text field

                        // to make the validator work we need to add form widget
                        if(value == null || value.isEmpty)
                          {
                            return "please enter title of the task";
                          }
                        return null;
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text('Title')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      validator: (value) {  // value is the text we write in the text field
                        if(value == null || value.isEmpty)
                        {
                          return "please enter the description of the task";
                        }
                        return null;
                      },
                      controller: DescriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text('Description')),
                    ),
                  ),
                  Text(
                    'Select Time',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                      onTap: () {
                        return DateTimep();
                      },
                      child: Text(SelectedDate.toString().substring(0, 10) , textAlign: TextAlign.center,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Mythemes.brimaryColour),
                        onPressed: () {
                        if(valKey.currentState!.validate())
                          {
                            TaskModel taskmodel = TaskModel(Title: titleController.text, Description: DescriptionController.text,
                                UserId: FirebaseAuth.instance.currentUser!.uid,

                                Date: DateUtils.dateOnly(SelectedDate).microsecondsSinceEpoch);
                            FireBaseFunctions.addTask(taskmodel);//.then make us apple to do something after adding the task

                              Navigator.pop(context); // navigator.pop make us close the bottom sheet after addding the task



                          }




                        },
                        child: Text(
                          'Create Task',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DateTimep() async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendate == null) {
      return;
    }
    SelectedDate = chosendate;

    setState(() {});
  }
}
