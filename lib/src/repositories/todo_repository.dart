import 'package:dio/dio.dart';
import 'package:todo_app/src/models/todo_model.dart';

class TodoRepository {

  Dio dio = Dio();

  final url = "https://jsonplaceholder.typicode.com/todos";

  TodoRepository([Dio? client]) {
    if (client == null) {
      dio = Dio();
    } else {
      dio = client;
    }
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos = [];

    for (var json in list) {
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
  }
}
