import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/list_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/list_page2.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/signup_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/onboarding_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/camera_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/contact_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/todo_list_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/login_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/map_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/menu_page.dart';
import 'package:bionic_teknologi_indonesia/main/home.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/chats_model.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/chatv3_model.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/chat_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/list_users_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/sign_in_chat.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/presentation/view/sign_up_chats.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final GoRouter routerApp = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Home.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      },
    ),
    GoRoute(
      path: '/onboarding-route',
      name: OnboardingPage.onboardingRoute,
      builder: (BuildContext context, GoRouterState state) {
        return OnboardingPage();
      },
    ),
    GoRoute(
      path: '/signUp-route',
      name: SignUp.signUpRoute,
      builder: (BuildContext context, GoRouterState state) {
        return SignUp();
      },
    ),
    GoRoute(
      path: '/list-route',
      name: ListPage.listRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ListPage();
      },
    ),
    GoRoute(
      path: '/menu-route',
      name: MenuPage.menuRoute,
      builder: (BuildContext context, GoRouterState state) {
        return MenuPage();
      },
    ),
    GoRoute(
      path: '/login-route',
      name: LoginPage.loginRoute,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/list2-route',
      name: ListPage2.list2Route,
      builder: (BuildContext context, GoRouterState state) {
        return ListPage2();
      },
    ),
    GoRoute(
      path: '/todolist-route',
      name: TodoListPage.todoListRoute,
      builder: (BuildContext context, GoRouterState state) {
        return TodoListPage();
      },
    ),
    GoRoute(
      path: '/map-route',
      name: MapPage.mapRoute,
      builder: (BuildContext context, GoRouterState state) {
        return MapPage();
      },
    ),
    GoRoute(
      path: '/camera-route',
      name: CameraPage.cameraRoute,
      builder: (BuildContext context, GoRouterState state) {
        return CameraPage();
      },
    ),
    GoRoute(
      path: '/createtask-route',
      name: CreateTask.createTaskRoute,
      builder: (BuildContext context, GoRouterState state) {
        return CreateTask();
      },
    ),
    GoRoute(
      path: '/contact-route',
      name: ContactPage.contactRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ContactPage();
      },
    ),
    GoRoute(
      path: '/signupchat-route',
      name: SignUpChats.signUpChatRoute,
      builder: (BuildContext context, GoRouterState state) {
        return SignUpChats();
      },
    ),
    GoRoute(
      path: '/signinchat-route',
      name: SignInChat.signInChatRoute,
      builder: (BuildContext context, GoRouterState state) {
        return SignInChat();
      },
    ),
    GoRoute(
      path: '/listusers-route',
      name: ListUsersPage.listUsersRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ListUsersPage();
      },
    ),
    GoRoute(
      path: '/chat-route',
      name: ChatPage.chatRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ChatPage(chatsModel: state.extra as ChatsModelV3);
      },
    ),
  ],
);
