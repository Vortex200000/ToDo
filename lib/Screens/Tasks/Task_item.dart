

import 'package:flutter/material.dart';
import 'package:todo/Models/TaskModel.dart';
import 'package:todo/Shared/Firebase/FirebaseFunc.dart';
import 'package:todo/Styles/Mythemes.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TaskItem extends StatelessWidget {
  // const TaskItem({super.key});
  TaskModel tasks;
  TaskItem({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0 , vertical: 18),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          color: Colors.white,
          child: Slidable(
            startActionPane: ActionPane(motion: DrawerMotion(), children: [
              SlidableAction(onPressed: (context) {
                    FireBaseFunctions.deleteTask(tasks.Id);
              },label: 'Delete',icon: Icons.delete,backgroundColor: Colors.red , borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
              SlidableAction(onPressed: (context) {

              },label: 'Edit',backgroundColor: Mythemes.brimaryColour,icon: Icons.edit,)
            ]),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Container(
                    height: 62,
                    color: Mythemes.brimaryColour,
                    width: 4,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          tasks.Title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,maxLines: 2,
                        ),
                        Text(tasks.Description,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Spacer(),
                  // ElevatedButton(
                  //   onPressed: () {
                  //         tasks.Isdone = true;
                  //
                  //         FireBaseFunctions.UpdateTask(tasks);
                  //   },
                  //   child: tasks.Isdone? Text('Done') : Text('Not done') , style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  // )
                  tasks.Isdone?
                  Container(
                    child: Text("Done!" , style: Theme.of(context).textTheme.bodySmall?.copyWith(color:Colors.white) , textAlign: TextAlign.center,),
                    width: MediaQuery.of(context).size.width*.16,
                    height: MediaQuery.of(context).size.height*.04,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  )

                  :InkWell(
                    onTap: () {
                      tasks.Isdone = true;
                    FireBaseFunctions.UpdateTask(tasks);
                    },
                    child: Container(
                      child: Icon(Icons.done , color: Colors.white,),
                      width: MediaQuery.of(context).size.width*.16,
                      height: MediaQuery.of(context).size.height*.04,
                      decoration: BoxDecoration(
                        color: Mythemes.brimaryColour,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
