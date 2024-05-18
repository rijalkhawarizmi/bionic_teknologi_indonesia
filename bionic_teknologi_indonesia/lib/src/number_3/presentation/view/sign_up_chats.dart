import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/common/custom_textfield.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/controllers/chats_controller.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/userID_model.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/list_users_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/sign_in_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/custom_text.dart';
import '../../../../core/style/sized_box.dart';

class SignUpChats extends StatelessWidget {
  SignUpChats({super.key});

  static const String signUpChatRoute = "signupchat-route";

  final name = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatsController>(
        init: ChatsController(),
        builder: (ChatsController controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: name, hintText: "Name"),
            CustomTextField(controller: password, hintText: "Password"),
            CustomButton(
              onPressed: () async {
                final bool result = await controller.signUp(
                    name.text.toLowerCase().trim(),
                    password.text.toLowerCase().trim());
                if (name.text.isEmpty || password.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Nama atau password harus diisi",
                      backgroundColor: ColorApp.red);
                } else if (result) {
                  controller.getMyID();
                  context.goNamed(SignInChat.signInChatRoute);
                } else {
                  Fluttertoast.showToast(msg: "Nama pengguna ini sudah ada");
                }
              },
              text: "Sign Up",
              colorText: ColorApp.white,
              fontSize: 20,
            ),
            const VerticalSizedBox(height: 20),
            Row(
              children: [
                const CustomText(
                    text: 'Apakah anda sudah punya akun?',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ColorApp.grey),
                InkWell(
                  onTap: () {
                    context.pushNamed(SignInChat.signInChatRoute);
                  },
                  child: const CustomText(
                      text: 'Masuk sekarang',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorApp.purple),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
