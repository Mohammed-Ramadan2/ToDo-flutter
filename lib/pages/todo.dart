import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todotile.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  TextEditingController _dialogController = TextEditingController();
  List todoList = [
    ['task1', false],
    ['task2', true],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(
      () {
        todoList[index][1] = !todoList[index][1];
      },
    );
  }

  void savingTODo() {
    setState(() {
      todoList.add([_dialogController.text, false]);
    });
    _dialogController.clear();
    Navigator.of(context).pop();
  }

  // Edit an existing task
  void saveEditedTODo(int index) {
    setState(() {
      todoList[index][0] = _dialogController.text; // Update task name
    });
    _dialogController.clear();
    Navigator.of(context).pop();
  }

 void CreateDialogBox({int? index}) {
    if (index != null) {
      // Editing: Pre-fill dialog with the task to be edited
      _dialogController.text = todoList[index][0];
    } else {
      // Adding: Clear the controller
      _dialogController.clear();
    }

    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _dialogController,
            onSave: index == null
                ? savingTODo // Add new task
                : () => saveEditedTODo(index), // Edit existing task
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("To Do"),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: CreateDialogBox,
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TodoTile(
              todoName: todoList[index][0],
              isComplete: todoList[index][1],
              onChanged: (x) {
                checkBoxChange(x, index);
              },
              onDelete: (BuildContext) {
                setState(() {
                  todoList.removeAt(index); // Delete task at index
                });
              },
              onEdit: (BuildContext) {
                CreateDialogBox(index: index); // Edit task at index
              },
            );
          },
          itemCount: todoList.length,
        ));
  }
}
