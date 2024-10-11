// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_crud/bloc/todo_bloc.dart';

class AllTodos extends StatefulWidget {
  const AllTodos({super.key});

  @override
  State<AllTodos> createState() => _AllTodosState();
}

class _AllTodosState extends State<AllTodos> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context.read<TodoBloc>().add(GetAllTodoEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos"),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return CircularProgressIndicator();
          } else if (state is LoadedState) {
            return state.allTodos.isEmpty
                ? Center(
                    child: Text("No data!"),
                  )
                : ListView.builder(
                    itemCount: state.allTodos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.allTodos[index].toString(),
                        ),
                      );
                    },
                  );
          }
          return Text("Nodsdcdfcvo");
        },
      ),
    );
  }
}
