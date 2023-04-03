import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/component/custom_text_field.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Crate ToDo'),
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
          CustomTextField(
            label: 'Date',
            controller: dateController,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: CheckboxListTile(
                title: const Text('Completed'),
                value: isSelected,
                onChanged: (val) {
                  setState(() {
                    isSelected = val ?? false;
                  });
                },
                contentPadding: EdgeInsets.zero),
          ),
          ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    dataController.text.isEmpty ||
                    dateController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Either title/data/date is empty')));
                } else {
                  FirebaseFirestore.instance.collection('Todo').add({
                    'title': titleController.text,
                    'data': dataController.text,
                    'createdDateTime': dateController.text,
                    'Completed': isSelected
                  }).then((value) => Navigator.pop(context));
                }
              },
              child: const Text('Create'))
        ],
      ),
    );
  }
}
