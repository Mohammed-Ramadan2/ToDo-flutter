import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  String todoName;
  bool isComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;
  Function(BuildContext)? onEdit;

  TodoTile({
    super.key,
    required this.todoName,
    required this.isComplete,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: Colors.blue.shade200,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(16),
          ),
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.red.shade300,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(16),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Checkbox(
                value: isComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                todoName,
                style: TextStyle(
                    decoration: isComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 18),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
