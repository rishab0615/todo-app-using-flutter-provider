import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  List<String> todo = [];
  List<bool> completed = [];
  TextEditingController controller = TextEditingController();

  void sumbit(context) {
    if (controller.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Enter a todo..!!!"),
            ],
          ),
          backgroundColor: Colors.red,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),

        ),
      );
      notifyListeners();
    } else {

        todo.add(controller.text.toString());
        completed.add(false);  // Add a false entry for the new task's completed status

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Todo added successfully"),
            ],
          ),
          backgroundColor: Colors.green,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
      print(controller.text);
        notifyListeners();

    }
  }

  void todocompleted(int index,context) {
      completed[index] = !completed[index];  // Toggle the completed status for the specific task
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text("To-do completed."),
          ],
        ),
        backgroundColor: Colors.green,
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();

  }

  void todoDelete(int index,context) {

      todo.removeAt(index);
      completed.removeAt(index);  // Also remove the completed status for the deleted task

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text("To-do deleted"),
          ],
        ),
        backgroundColor: Colors.deepOrangeAccent,
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

}