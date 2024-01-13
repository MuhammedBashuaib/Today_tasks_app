import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app_with_provider/business_logic/provider/task_data.dart';
import 'package:todo_list_app_with_provider/const.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemCount: taskData.taskCoutn,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              taskData.deleteTask(taskData.myTasks[index]);
            },
            title: Text(
              "${taskData.getTaskName(index)}",
              style: TextStyle(
                fontSize: fSize * 1.2,
                decoration: taskData.getChecked(index) == true
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: Checkbox(
              value: taskData.getChecked(index),
              onChanged: (value) {
                taskData.changeChecked(index, value!);
              },
            ),
          );
        },
      ),
    );
  }
}
