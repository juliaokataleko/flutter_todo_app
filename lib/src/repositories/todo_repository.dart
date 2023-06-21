import 'package:dio/dio.dart';
import 'package:todo_app/src/models/todo_model.dart';

class TodoRepository {
  Dio dio = Dio();

  final url = "https://jsonplaceholder.typicode.com/todos";

  TodoRepository([Dio? client]) : dio = client ?? Dio();

  // TodoRepository([Dio? client]) {
  //   dio = client ?? Dio();
  // }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();

    // List<TodoModel> todos = [];

    // for (var json in list) {
    //   final todo = TodoModel.fromJson(json);
    //   todos.add(todo);
    // }

    // return todos;
  }
}
