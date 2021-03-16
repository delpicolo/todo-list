import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/repository/todo_repository.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = TodoRepository();

  test('Should return a list', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: jsonDecode(jsonData)));

    final list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}

String jsonData = '';
