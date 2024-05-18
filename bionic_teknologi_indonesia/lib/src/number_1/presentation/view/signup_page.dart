import 'package:bionic_teknologi_indonesia/common/custom_textfield.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/widgets/clippath.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/list_page.dart';
import 'package:bionic_teknologi_indonesia/core/style/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_text.dart';
import '../../../../core/style/color_app.dart';

class SignUp extends StatelessWidget {
  static const String signUpRoute = 'SignUp-route';
  SignUp({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children: [
            ClipPath(
            clipper: WaveClipper(),
            child: Container(
              width:  MediaQuery.of(context).size.width, // Adjust the width as needed
              height: 150, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5722), Color(0xFFFF9800)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ),
              VerticalSizedBox(height: 100),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: name,
                    hintText: 'Name',
                    colorHint: ColorApp.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomTextField(
                      controller: email,
                      hintText: 'Email',
                      colorHint: ColorApp.black,
                    ),
                  ),
                  CustomTextField(
                    controller: password,
                    hintText: "Password",
                    colorHint: ColorApp.black,
                  )
                ],
              ),
              VerticalSizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: ColorApp.purple,
                        ),
                        CustomText(
                            text: 'Remember',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.black)
                      ],
                    ),
                    CustomText(
                        text: 'Lorem Ipsum',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorApp.purple)
                  ],
                ),
              ),
              CustomButton(
                onPressed: () {
                  context.pushNamed(ListPage.listRoute);
                },
                height: 50,
                widht: 200,
                borderRadius: 50,
                color: ColorApp.purple,
                text: 'Sign Up',
                colorText: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              VerticalSizedBox(height: 70),
              CustomText(
                  text: 'Apakah anda sudah punya akun?',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.grey),
              CustomText(
                  text: 'Masuk sekarang',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.purple)
                ],),
              )
            ],
          ),
        ),
        );
  }

  
}




