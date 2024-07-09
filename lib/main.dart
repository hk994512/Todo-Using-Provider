import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/tasks_set_provider.dart';
import 'screens/home.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TasksSetList()),
      ],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    ));
