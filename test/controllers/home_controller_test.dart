import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/repository/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test('should fill todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
