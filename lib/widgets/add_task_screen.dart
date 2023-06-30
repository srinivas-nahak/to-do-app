import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/module/task_notifier.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  void submitData(BuildContext context) {
    if (_textFieldController.text.isNotEmpty) {
      Provider.of<TaskNotifier>(context, listen: false)
          .addData(_textFieldController.text);

      Navigator.pop(context);
    } else {
      showErrorScreen(context);

      Future.delayed(Duration(milliseconds: 1500)).then((value) {
        Navigator.pop(context);
      });
    }
  }

  void showErrorScreen(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        //backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            height: 80,
            color: Colors.redAccent,
            width: double.infinity,
            child: Text(
              "Please Enter The Task",
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
          ),
          TextField(
            controller: _textFieldController,
            autofocus: true,
            onSubmitted: (taskData) {
              submitData(context);
            },
            decoration: const InputDecoration(
              enabled: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              submitData(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "Add",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
