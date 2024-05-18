import 'dart:math';

import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/custom_text.dart';
import '../../../../core/style/color_app.dart';
import '../../../../core/style/sized_box.dart';
import '../../controllers/chats_controller.dart';
import '../../models/chatv3_model.dart';
import 'sign_in_chat.dart';

class ListUsersPage extends StatelessWidget {
  static const String listUsersRoute = "listusers-route";

  final name = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: "Chat App",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorApp.black600),
      ),
      body: GetBuilder<ChatsController>(
          init: ChatsController(),
          builder: (ChatsController controller) {
            return Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                children: [
                  CustomText(
                      text: "Anda login sebagai ${controller.myID}" ?? "",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.black),
                  InkWell(
                    onTap: () {
                      context.goNamed(SignInChat.signInChatRoute);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Keluar" ?? "",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorApp.red),
                        Icon(
                          Icons.logout,
                          color: ColorApp.red,
                        )
                      ],
                    ),
                  ),
                  VerticalSizedBox(height: 30),
                  Expanded(
                    child: StreamBuilder(
                        stream: controller.streamUser,
                        builder: (context, snapsot) {
                          if (!snapsot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            final user = snapsot.data;

                            user?.removeWhere(
                                (element) => element.name == controller.myID);
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: user!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(ChatPage.chatRoute,
                                        extra: ChatsModelV3(
                                            receiverID: user[index].name,
                                            senderID: controller.myID!,
                                            message: ""));
                                  },
                                  child: Container(
                                    height: 100,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    margin: const EdgeInsets.only(
                                        left: 10, bottom: 5, right: 10),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: ColorApp.grey),
                                        color: ColorApp.orange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                                        user[index].name ?? "",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorApp.white),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
