import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_crud/bloc/todo_bloc.dart';
import 'package:sqlflite_crud/db_helper/repository.dart';
import 'package:sqlflite_crud/screens/all_todos.dart';
import 'package:sqlflite_crud/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print("nbjngbv");
    return BlocProvider(
      create: (context) => TodoBloc(Repository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AllTodos(),
      ),
    );
  }
}
