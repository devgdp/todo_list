// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/src/features/app/presentations/controllers/app_controller.dart';

import '../../../../shared/models/todo.dart';
import '../../../../shared/widgets/todo_list_item.dart';

class TodoListPage extends GetView<AppController> {
  TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.tasksController,
                          onChanged: (value) {
                            controller.nomeTarefa = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex. Estudar',
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.nomeTarefa != '') {
                              final todo = Todo(
                                  title: controller.nomeTarefa,
                                  dateTime: DateTime.now());
                              controller.criarTarefa(todo);
                              controller.tasksController.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff00d7f3),
                            padding: EdgeInsets.all(19),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  controller.obx(
                    (task) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: task!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {},
                          child: TodoListItem(
                              todo: controller.tasks[i],
                              onDelete: () {
                                //  controller.removerTarefa(controller.tasks[i]);
                              }),
                        );
                      },
                    ),
                    // onLoading: const ShimmerGridVideo(),
                    onEmpty: const SizedBox(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return Text(
                            'Você possui ${controller.qtdTarefa} tarefas pendentes',
                          );
                        }),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          controller.limparLista();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00d7f3),
                          padding: EdgeInsets.all(19),
                        ),
                        child: Text('Limpar tudo'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
