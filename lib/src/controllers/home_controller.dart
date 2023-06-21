import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _todoRepository;

  HomeController([TodoRepository? todoRepository]): _todoRepository = todoRepository ?? TodoRepository();

  Future start() async {
    todos = await _todoRepository.fetchTodos();
  }
}
