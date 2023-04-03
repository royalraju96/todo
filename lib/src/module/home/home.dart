import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/module/todo/create_todo.dart';
import 'package:todo/src/module/todo/edit_todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.power_settings_new_outlined),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Todo').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              final todoItem = snapshot.data!.docs[index];
              return Card(
                elevation: 8,
                shadowColor: Colors.red,
                child: ListTile(
                  title: Text(todoItem['title']),
                  subtitle: Text(todoItem['data']),
                  trailing: IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('Todo')
                            .doc(todoItem.id)
                            .delete();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${todoItem['title']} item is deleted from the list'),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditTodo(
                                  title: todoItem['title'],
                                  data: todoItem['data'],
                                  id: todoItem.id,
                                  date: todoItem['createdDateTime'],
                                  isSelected: todoItem['Completed'],
                                )));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateTodo(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
