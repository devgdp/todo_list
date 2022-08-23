import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/src/shared/widgets/todo_list_item.dart';

import '../../../../shared/models/todo.dart';

class AppController extends GetxController with StateMixin<List<Todo>> {
  static AppController get to => Get.find();

  final TextEditingController tasksController = TextEditingController();

  bool carregando = false;
  List<Todo> tasks = [];

  final _nomeTarefa = ''.obs;
  get nomeTarefa => _nomeTarefa.value;
  set nomeTarefa(value) => _nomeTarefa.value = value;

  final _qtdTarefa = 0.obs;
  get qtdTarefa => _qtdTarefa.value;
  set qtdTarefa(value) => _qtdTarefa.value = value;

  final _tarefa = Rxn<TodoListItem>();
  TodoListItem? get tarefa => _tarefa.value;
  set tarefa(TodoListItem? value) => _tarefa.value = value;

  void criarTarefa(Todo task) async {
    carregando = true;
    if (tasks.isEmpty) change(null, status: RxStatus.loading());
    tasks.add(task);
    qtdTarefa = tasks.length;
    carregando = false;
    nomeTarefa = '';

    log(tasks.length.toString());
    change(tasks, status: RxStatus.success());
  }

  void removerTarefa(Todo tarefa) {
    tasks.remove(tarefa);
  }

  void limparLista() {
    tasks.clear();
    qtdTarefa = 0;
  }
}
