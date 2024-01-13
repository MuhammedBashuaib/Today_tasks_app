import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app_with_provider/business_logic/provider/task_data.dart';
import 'package:todo_list_app_with_provider/const.dart';
import 'package:todo_list_app_with_provider/data/model/task.dart';
import 'package:todo_list_app_with_provider/presentation/widgets/custom_elevated_button.dart';
import 'package:todo_list_app_with_provider/presentation/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  TextEditingController task = TextEditingController();
  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: heightScreen * .02, horizontal: widthScreen * .06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.indigo[400],
              fontSize: fSize * 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTextFormField(
            controller: task,
          ),
          SizedBox(
            height: heightScreen * .02,
          ),
          Consumer<TaskData>(
            builder: (context, taskData, child) => CustomElevatedButton(
              onPressed: () {
                taskData.addTask(Task(taskName: task.text, checked: false));
                task.text = "";
              },
            ),
          ),
        ],
      ),
    );
  }
}
