import 'package:flutter/material.dart';

import 'package:todo_list_app_with_provider/const.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal[400]),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          vertical: heightScreen * .015,
          horizontal: widthScreen * .08,
        )),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widthScreen * .015),
        )),
      ),
      child: Text(
        "Add",
        style: TextStyle(
          color: MyColors.myWhite,
          fontSize: fSize * 1.3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
