import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../component/custom_text_field.dart';

class EditTodo extends StatefulWidget {
  const EditTodo(
      {super.key,
      required this.data,
      required this.title,
      required this.id,
      required this.date,
      required this.isSelected});

  final String title, data, id, date;
  final bool isSelected;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CustomTextField(
            label: 'Title',
            controller: titleController,
          ),
          CustomTextField(
            label: 'Data',
            controller: dataController,
          ),
          ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    dataController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Either title/data/date is empty')));
                } else {
                  FirebaseFirestore.instance
                      .collection('Todo')
                      .doc(widget.id)
                      .update({
                    'Completed': widget.isSelected,
                    'title': titleController.text.trim(),
                    'data': dataController.text.trim(),
                    'createdDateTime': widget.date
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Edit'))
        ],
      ),
    );
  }
}
