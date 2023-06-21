import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/controllers/home_controller.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();

  final HomeController homeController = HomeController(repository);
  test("Deve preencher a variavel todos", () async {

    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]); 
    await homeController.start();
    expect(homeController.todos.isNotEmpty, true);
    
  });

  test("Deve retornar uma lista vazia de todos", () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => []); 
    await homeController.start();
    expect(homeController.todos.isEmpty, true);
  });
}
