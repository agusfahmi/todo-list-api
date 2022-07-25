import 'package:flutter/material.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';

class todo_provider with ChangeNotifier{
  List<TodoModel> __todolist = [];
  List<TodoModel> get todoList => __todolist;

  void addTodo(TodoModel todo) async
  {
    __todolist.add(todo);
    notifyListeners();
  }
  void removeTodo(TodoModel todo){
    __todolist = __todolist.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }
  void updateTodo(TodoModel todo){
    __todolist[__todolist.indexWhere((item) => item.id == todo.id)] = todo;
    notifyListeners();
  }
  void gettotalTodo(){
    __todolist.length.toString();
  }
}