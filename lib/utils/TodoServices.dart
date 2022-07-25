import 'dart:convert';
import 'package:http/http.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';

class TodoService {
  final String apiUrl =
      "https://62c309b2876c4700f535280f.mockapi.io/todo_list";

  Future<List<TodoModel>> getTodo() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> body = jsonDecode(response.body);
      List<TodoModel> emails =
          body.map((dynamic item) => TodoModel.fromJson(item)).toList();

      return emails;
    } else {
      throw "Gagal mengambil data todo!";
    }
  }

  Future<TodoModel> getTodoById(String id) async {
    final response = await get(Uri.parse(apiUrl + "/$id"));

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengambil data todo!");
    }
  }

  Future<TodoModel> sendTodo(TodoModel todo) async {
    Map data = {
      "title": todo.title
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengirim todo!");
    }
  }

  Future<TodoModel> updateTodo(String id, TodoModel todo) async {
    Map data = {
      "title": todo.title,
    };

    final Response response = await put(
      Uri.parse(apiUrl + "/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengupdate todo!");
    }
  }

  Future<void> deleteTodo(String id) async {
    Response res = await delete(Uri.parse(apiUrl + "/$id"));

    if (res.statusCode == 200) {
      print("Email deleted");
    } else {
      throw "Gagal menghapus todo.";
    }
  }
}
