import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/tasks_set_provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksSetList>(context);
    final scaffold = ScaffoldMessenger.of(context);
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).cardColor,
          fontSize: 20,
        );
    return ListView.builder(
      itemCount: provider.tasks.length,
      itemBuilder: (ctx, index) => Card(
        color: provider.tasks[index].color,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                provider.tasks[index].title,
                style: style,
              ),
              title: Text(
                "\$${provider.tasks[index].price}",
                style: style,
              ),
              trailing: IconButton(
                onPressed: () {
                  final removedTask = provider.tasks[index];
                  final removedIndex = index;
                  provider.removeItems(index);
                  scaffold.clearSnackBars();
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        "${removedTask.title} has been deleted.",
                      ),
                      action: SnackBarAction(
                          label: "UNDO",
                          textColor: Colors.white,
                          onPressed: () {
                            provider.undoTask(removedIndex, removedTask.title,
                                removedTask.price, removedTask.color);
                          }),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
