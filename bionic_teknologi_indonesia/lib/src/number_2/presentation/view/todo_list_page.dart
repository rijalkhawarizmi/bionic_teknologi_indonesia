import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/common/custom_textfield.dart';
import 'package:bionic_teknologi_indonesia/main.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/style/color_app.dart';
import '../../../../core/style/sized_box.dart';
import '../../model/task_model.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});
  static const String todoListRoute = "todolist-route";

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final name = TextEditingController();
  final phone = TextEditingController();

  late Stream<List<TaskModel>> streamTask;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamTask = objectBox.getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(CreateTask.createTaskRoute);
        },
        child: CustomText(
            textAlign: TextAlign.center,
            text: "Add Task",
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: ColorApp.black),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: streamTask,
                    builder: (context, snapsot) {
                      if (snapsot.data!.isEmpty) {
                        return Center(
                            child: CustomText(
                                text: "Belum ada catatan",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorApp.black));
                      } else {
                        final taskModel = snapsot.data;
                        return ListView.builder(
                          itemCount: taskModel?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 100,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              margin: const EdgeInsets.only(
                                  left: 10, bottom: 5, right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorApp.grey),
                                  color: ColorApp.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 50,
                                        color: ColorApp.white,
                                      ),
                                      HorizontalSizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text:
                                                  taskModel?[index].title ?? "",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: ColorApp.white),
                                          CustomText(
                                              text: taskModel?[index]
                                                      .description ??
                                                  "",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: ColorApp.white)
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        objectBox
                                            .deleteTask(taskModel![index].id);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            );
                          },
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}

class CreateTask extends StatelessWidget {
  CreateTask({super.key});
  static const String createTaskRoute = "createtask-route";

  final title = TextEditingController();
  final desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: title, hintText: "Title"),
            CustomTextField(controller: desc, hintText: "Description"),
            CustomButton(
                onPressed: () {
                  final task =
                      TaskModel(title: title.text, description: desc.text);
                  objectBox.createTask(task);
                  context.pop();
                },
                text: "Create")
          ],
        ),
      ),
    );
  }
}
