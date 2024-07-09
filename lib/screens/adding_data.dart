import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/todo_tasks.dart';
import 'package:todo_app/providers/tasks_set_provider.dart';

import '../widgets/textfield.dart';

class TodoSet extends StatefulWidget {
  const TodoSet({
    super.key,
  });

  @override
  State<TodoSet> createState() => _TodoSetState();
}

class _TodoSetState extends State<TodoSet> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _key = GlobalKey<FormState>();
  late String title;
  late double amount;
  final _titleFocus = FocusNode();
  final _amountFocus = FocusNode();
  Todo? newTask;
  @override
  @override
  void dispose() {
    _titleFocus.dispose();
    _amountFocus.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<TasksSetList>(context);
    final sfd = ScaffoldMessenger.of(context);
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFieldWidget(
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_amountFocus);
              },
              focusNode: _titleFocus,
              controller: _controller1,
              title: "Enter title",
              onChange: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextFieldWidget(
              focusNode: _amountFocus,
              controller: _controller2,
              title: "Enter price",
              onChange: (value) {
                setState(() {
                  amount = double.parse(value);
                });
              },
            ),
            const SizedBox(
              height: 2,
            ),
            TextButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    sfd.clearSnackBars();
                    sfd.showSnackBar(SnackBar(
                        content: Text(
                            " ${title.substring(0).toUpperCase()} has been added.")));

                    provider2.addItems(title, amount, Colors.red);
                  }
                },
                child: const Text("Submit Data"))
          ],
        ),
      ),
    );
  }
}
