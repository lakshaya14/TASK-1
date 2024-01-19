import 'package:flutter/material.dart';
import 'package:flutter_project/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
VoidCallback onCancel;

  DialogBox({
    super.key,required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(text: 'Save',onPressed: onSave),

                SizedBox(width: 8),
                // Cancel button
                MyButton(text: "Cancel",onPressed: onCancel),

                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
