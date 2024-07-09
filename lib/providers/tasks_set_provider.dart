import 'package:flutter/material.dart';

import '../data/todo_tasks.dart';

class TasksSetList extends ChangeNotifier {
  final List<Todo> tasks = [
    Todo(title: "New Shoes", price: 18.44, color: Colors.teal),
    Todo(title: "Groceries", price: 20.22, color: Colors.green),
    Todo(
        title: "Vegetables",
        price: 12.44,
        color: const Color.fromARGB(255, 204, 161, 30)),
    Todo(title: "Milk", price: 10.34, color: Colors.purple),
  ];

  List<Todo> get items {
    return [...tasks];
  }

  void addItems(String title, double price, Color? color) {
    tasks.add(Todo(title: title, price: price, color: color!));
    notifyListeners();
  }

  void undoTask(int index, String? title, double? price, Color? color) {
    if (title == null || price == null) {
      throw ArgumentError('Title and price must not be null');
    }
    final existingIndex = index;
    final item = Todo(title: title, price: price, color: color!);
    tasks.insert(existingIndex, item);

    notifyListeners();
  }

  void removeItems(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
