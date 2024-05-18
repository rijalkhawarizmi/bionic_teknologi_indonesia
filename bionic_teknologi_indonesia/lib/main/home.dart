import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/onboarding_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/signup_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/menu_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/sign_up_chats.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String homeRoute="home-route";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(OnboardingPage.onboardingRoute);
              },
              child: Text('Number 1'),
            ),
             ElevatedButton(
              onPressed: () {
                context.pushNamed(MenuPage.menuRoute);
              },
              child: Text('Number 2'),
            ),
             ElevatedButton(
              onPressed: () {
                context.pushNamed(SignUpChats.signUpChatRoute);
              },
              child: Text('Number 3'),
            )
          ],
        ),
      ),
    );
  }
}
