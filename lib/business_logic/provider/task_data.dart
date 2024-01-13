import 'package:flutter/material.dart';

import 'package:todo_list_app_with_provider/data/model/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _myTasks = [];

  addTask(Task task) {
    _myTasks.add(task);
    notifyListeners();
  }

  deleteTask(Task task) {
    _myTasks.remove(task);
    notifyListeners();
  }

  changeChecked(int index, bool value) {
    _myTasks[index].checked = value;
    notifyListeners();
  }

  getTaskName(int index) {
    return _myTasks[index].taskName;
  }

  getChecked(int index) {
    return _myTasks[index].checked;
  }

  get taskCoutn => _myTasks.length;
  get myTasks => _myTasks;
}
