import 'dart:async';

import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/common/custom_textfield.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/controllers/chats_controller.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/chats_model.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/sign_in_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/style/sized_box.dart';
import '../../models/chatv3_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.chatsModel});
  final ChatsModelV3 chatsModel;

  static const String chatRoute = "chat-route";

  final message = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<ChatsController>(
          init: ChatsController(),
          builder: (ChatsController controller) {
            late Stream<List<ChatsModelV3>> streamChat;
            streamChat = controller.getListChats(
                chatsModel.senderID, chatsModel.receiverID);
            return Column(
              children: [
                const VerticalSizedBox(height: 30),
                CustomText(
                    text: "Anda login sebagai ${controller.myID}" ?? "",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.black),
                InkWell(
                  onTap: () {
                    context.goNamed(SignInChat.signInChatRoute);
                  },
                  child: const Row(
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
                Expanded(
                  child: StreamBuilder(
                      stream: streamChat,
                      builder: (context, snapsot) {
                        if (!snapsot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final chatsModel = snapsot.data;
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: chatsModel?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      chatsModel?[index].senderID ==
                                              controller.myID
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                  children: [
                                    chatsModel?[index].receiverID ==
                                            controller.myID
                                        ? Row(
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                size: 30,
                                                color: ColorApp.grey200,
                                              ),
                                              const HorizontalSizedBox(width: 10),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 5),
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  color: ColorApp.grey200,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: CustomText(
                                                    textAlign: TextAlign.center,
                                                    text: chatsModel?[index]
                                                            .message ??
                                                        "",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorApp.white),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              const HorizontalSizedBox(width: 10),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 5),
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  color: ColorApp.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: CustomText(
                                                    textAlign: TextAlign.center,
                                                    text: chatsModel?[index]
                                                            .message ??
                                                        "",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorApp.white),
                                              ),
                                              const Icon(
                                                Icons.person,
                                                size: 30,
                                                color: ColorApp.grey,
                                              ),
                                            ],
                                          )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      }),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: message, hintText: "Message")),
                    IconButton(
                        onPressed: () {
                          controller.createChats(ChatsModelV3(
                              receiverID: chatsModel.receiverID,
                              senderID: chatsModel.senderID,
                              message: message.text));
                          message.clear();
                        },
                        icon: const Icon(Icons.send))
                  ],
                )
              ],
            );
          }),
    );
  }
}
