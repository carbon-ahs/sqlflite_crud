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
class UpdateTodoEvent extends TodoEvent {
  final Todos todos;
  const UpdateTodoEvent(this.todos);
  @override
  List<Object> get props => [todos];
}

//Delete todo Event
class DeleteTodoEvent extends TodoEvent {
  final int id;
  const DeleteTodoEvent(this.id);
  @override
  List<Object> get props => [id];
}

//Get todo By ID
class GetTodoByIdEvent extends TodoEvent {
  final int id;
  const GetTodoByIdEvent(this.id);
  @override
  List<Object> get props => [id];
}
