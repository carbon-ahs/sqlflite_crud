part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

//Get Event
class GetAllTodoEvent extends TodoEvent{
  @override
  List<Object> get props => [];
}

//Add todo Event
class AddTodoEvent extends TodoEvent {
  final Todos todos;
  const AddTodoEvent(this.todos);
  @override
  List<Object> get props => [todos];
}

//Update todo Event
class UpdatetodoEvent extends TodoEvent {
  final Todos todos;
  const UpdatetodoEvent(this.todos);
  @override
  List<Object> get props => [todos];
}

//Delete todo Event
class DeletetodoEvent extends TodoEvent {
  final int id;
  const DeletetodoEvent(this.id);
  @override
  List<Object> get props => [id];
}

//Get todo By ID
class GettodoByIdEvent extends TodoEvent {
  final int id;
  const GettodoByIdEvent(this.id);
  @override
  List<Object> get props => [id];
}
