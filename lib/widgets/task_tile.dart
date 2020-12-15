import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tittle;
  final Function toggleTaskState;
  final Function deleteTask;

  TaskTile(
      {this.tittle, this.isChecked, this.toggleTaskState, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tittle,
        style: TextStyle(
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleTaskState,
      ),
      onLongPress: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Delete this task ?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Approve'),
                  onPressed: () {
                    deleteTask();
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }),
    );
  }
}
