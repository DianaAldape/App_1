import 'package:flutter/material.dart';

class newTask extends StatefulWidget {
  final Task task;
  final String appBarTitle;
  TaskListState taskListState;
  int position;

  newTask(this.task, this.appBarTitle, this.taskListState,
      [this.position = -1]);

  @override
  State<StatefulWidget> createState() {
    return NewTaskState(
        this.task, this.appBarTitle, this.taskListState, this.position);
  }
}

class NewTaskState extends State<newTask> {
  TaskListState taskListState;
  String title;
  Task tarea;
  int position;

  NewTaskState(this.task, this,title, this,TaskListState, this position);

  TextEditingController taskController = new TextEditingController();
  @override


  Widget build(BuildContext context) {
    taskController.text = task.name;

    return Scaffold(
      key: GlobalKey<ScaffoldState>(),leading: new GestureDetector(
        child: Icon(Icons.close),
        onTap: () {
          Navigator.pop(context;
          taskListState.updateListView()); 
        },
      ),
      appBar: AppBar(
        leading: new GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
            taskListState.updateListView(); 
          },
        ),
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: _estaEditando() ? CheckboxListTile(
              title: Text("Completada")
                )
              : Container(height: 2,)
            ),

        ],)
    );
  }




bool _estaEditando () {
  bool edit = false;
  if (this.position == -1)
    edit = true;
    return edit;
}

}
