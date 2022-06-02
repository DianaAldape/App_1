import 'package:flutter/material.dart';
import 'package:tasksList/Tasks/Tasks.dart';
import '/Tasks/taskCard.dart';

/*class Tasks extends StatelessWidget {

  List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
    );
  }
}
*/

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskListState();
  }
}

class TaskListState extends State<TaskList> {
  List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    if (tasksList == null) tasksList = [];

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int position) {
              final item = tasksList[position];
              return new GestureDetector(
                  onTap: () {
                    _editTask(tasksList, this, position);
                  },
                  child: Dismissible(
                    key: Key(item.name),
                    onDismissed: (direction) {
                      delete(position);
                    },
                    child: Card(
                      margin: EdgeInsets.all(1.0),
                      elevation: 2.0,
                      child: taskCard(
                        title: item.name,
                        state: item.state,
                      ),
                    ),
                  ));
            }));
  }

  void _editTask(Task task, TaskListState obj, int position) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                newTask(task, "Editar tarea", obj, position)));
    updateListView();
  }

  void delete(int position) {
    this.tasksList.remove(position);
    //Actualizar estado
    updateListView();
  }

  void updateListView() {
    setState(() {
      this.tasksList = tasksList;
    });
  }
}
