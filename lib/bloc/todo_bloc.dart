import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqlflite_crud/db_helper/repository.dart';
import 'package:sqlflite_crud/models/todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Repository repository;
  TodoBloc(this.repository) : super(TodoInitial()) {
    //Event controllers

    //GET ALL NOTE EVENT
    on<GetAllTodoEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final todos = await repository.getTodos();
        emit(LoadedState(todos));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });

    //Add Todo Event [ON ADD BUTTON]
    on<AddTodoEvent>((event, emit) async {
      emit(LoadingState());
      try {
        //1 sec delay
        Future.delayed(const Duration(seconds: 1));
        int res = await repository.addTodo(
          Todos(
              headings: event.todos.headings,
              details: event.todos.details,
              dueDate: event.todos.dueDate,
              createdAt: event.todos.createdAt),
        );

        if (res > 0) {
          emit(SuccessTodoInsertion());
          //Call Fetch Todo Event, once there is a new todo
          add(GetAllTodoEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });

    //Get Todo By Id [On a Single Todo Click] - Let you to Get a Todo by ID
    on<GetTodoByIdEvent>((event, emit) async {
      final todos = await repository.getTodoById(event.id);
      emit(GetTodoByIdState(todos));
    });

    //Update Todo Event - When [ON UPDATE BUTTON] is Pressed
    on<UpdateTodoEvent>((event, emit) async {
      try {
        final todos = await repository.updateTodo(Todos(
          todoId: event.todos.todoId,
          headings: event.todos.headings,
          details: event.todos.details,
          dueDate: event.todos.createdAt,
          createdAt: event.todos.createdAt,
        ));

        if (todos > 0) {
          emit(SuccessTodoUpdate());
          add(GetAllTodoEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });

    //Delete Todo Event - When [ON Delete BUTTON] is Pressed
    on<DeleteTodoEvent>((event, emit) async {
      try {
        final res = await repository.deleteTodo(event.id);
        if (res > 0) {
          emit(SuccessTodoDelete());
          add(GetAllTodoEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
  }
}
