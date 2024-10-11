part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

// Loading State
final class LoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

// Get All Todos
final class LoadedState extends TodoState {
  final List<Todos> allTodos;
  const LoadedState(this.allTodos);
  @override
  List<Object> get props => [allTodos];
}

// In case when there is an error
final class FailureState extends TodoState {
  final String errorMessage;
  const FailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

// //Get Todo by ID
// final class GetTodoByIdState extends TodoState {
//   final Todos todos;
//   const GetTodoByIdState(this.todos);
//   @override
//   List<Object?> get props => [todos];
// }

// //Success Todo Add Insertion
// final class SuccessTodoInsertion extends TodoState {
//   @override
//   List<Object?> get props => [];
// }

// final class SuccessTodoUpdate extends TodoState {
//   @override
//   List<Object?> get props => [];
// }

// final class SuccessTodoDelete extends TodoState {
//   @override
//   List<Object?> get props => [];
// }
