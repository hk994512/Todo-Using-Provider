import 'package:flutter/material.dart';
import 'package:todo_app/adding_data.dart';
import '../widgets/task_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).cardColor,
          fontSize: 20,
        );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: "Add Task",
              onPressed: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    showDragHandle: true,
                    context: context,
                    builder: (c) => const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: TodoSet(),
                        ));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 10, 34),
        title: Text(
          "Todo",
          style: style,
        ),
      ),
      body: const TasksList(),
    );
  }
}
