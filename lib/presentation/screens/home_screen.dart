import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app_with_provider/business_logic/provider/task_data.dart';
import 'package:todo_list_app_with_provider/const.dart';
import 'package:todo_list_app_with_provider/presentation/screens/add_task_screen.dart';
import 'package:todo_list_app_with_provider/presentation/widgets/custom_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool press = false;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[400],
        onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskScreen(),
                ),
              );
            }),
        child: MyIcons.add,
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        margin: EdgeInsets.only(
          top: heightScreen * .06,
          left: widthScreen * .04,
          right: widthScreen * .04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Consumer<TaskData>(
                  builder: (context, taskData, child) => IconButton(
                    onPressed: () {
                      if (press == false) {
                        for (int index = 0;
                            index < taskData.taskCoutn;
                            index++) {
                          taskData.changeChecked(index, true);
                        }
                        press = !press;
                      } else {
                        for (int index = 0;
                            index < taskData.taskCoutn;
                            index++) {
                          taskData.changeChecked(index, false);
                        }
                        press = !press;
                      }
                    },
                    icon: MyIcons.playListAddCheck,
                    color: MyColors.myWhite,
                    iconSize: heightScreen * .05,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: widthScreen * .05),
                  child: Text(
                    "ToDayDo",
                    style: TextStyle(
                      fontSize: fSize * 2.5,
                      color: MyColors.myWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widthScreen * .03,
                top: heightScreen * .02,
                bottom: heightScreen * .02,
              ),
              child: Consumer<TaskData>(
                builder: (context, taskData, child) => Text(
                  "${taskData.taskCoutn} Tasks",
                  style: TextStyle(
                    color: MyColors.myWhite,
                    fontSize: fSize * 1.2,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * .05),
              height: heightScreen * .755,
              decoration: BoxDecoration(
                  color: MyColors.myWhite,
                  borderRadius: BorderRadius.circular(widthScreen * .04)),
              child: const CustomListView(),
            )
          ],
        ),
      ),
    );
  }
}
