import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';

import '../../Styles/Mythemes.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo/Screens/Tasks/Task_item.dart';
class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {



  late DateTime selectedDate;

  void initState() {
    super.initState();
    _resetSelectedDate();
  }
  void _resetSelectedDate() {
    selectedDate = DateTime.now().add(const Duration(days: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        CalendarTimeline(
          showYears: false,
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => setState(() => selectedDate = date),
          leftMargin: 40,
          monthColor: Mythemes.blackColour,
          dayColor: Mythemes.blackColour,
          dayNameColor: const Color(0xFF333A47),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Mythemes.brimaryColour,
          dotsColor: const Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),


        // Expanded(
        //   child: ListView.builder(
        //     itemBuilder: (context, index) {
        //       return TaskItem();
        //     },
        //     itemCount: 8,
        //   ),
        // ),
        StreamBuilder(stream: FireBaseFunctions.getTasks(selectedDate), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator());
              }
            if(snapshot.hasError)
              {
                return Center(child: Text('Some thing went wrong please try agin later '));
              }
            List<TaskModel>Tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
//the llast line we make alist of taks model named Tasks this list is assigned to snapshot which cary data and the data cary docs
        // but the docs cant be assigned to type of list of taksModel becasue its type is query snapshot so we will map it using map() function this map function
       // will make us convert the querysnapshot to TaskModel so (e) is a single item which will be maped item of type TaskModel
          // by getting the data from each single doc and convert it to alist of TaskModel using .toList

          // and the piece of code (?? []) means if the list is null make an empty list
          if(Tasks.isEmpty){
            return Center(child: Text("No Tasks"));
          }

          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {

              return TaskItem(tasks: Tasks[index],);
            } ,itemCount: Tasks.length,),
          );
        },)
      ],
    );
  }
}


