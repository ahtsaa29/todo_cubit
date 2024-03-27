import 'package:bloc_cubit_todo_app/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError("title can not be empty");
      return;
    }
    final todo = TodoModel(name: title, createdAt: DateTime.now());
    // emit([todo]);
    state.add(todo);
    emit([...state]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print('toDO cubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("TodoCubit - $error");
  }
}
