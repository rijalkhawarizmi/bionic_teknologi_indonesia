import 'package:bionic_teknologi_indonesia/common/custom_button.dart';
import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/signup_page.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/core/style/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  static const String onboardingRoute = "onboarding-route";
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPages = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPages ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 15.0,
      width: isActive ? 16.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive == true ? ColorApp.white : ColorApp.grey,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
    );
  }

  Widget buildColumn({String? images, String? description, int? number}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            CustomText(
                text: "Mountain $number",
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: ColorApp.white),
            VerticalSizedBox(height: 70),
            Center(child: Image.network(images!,width: 300,)),
            VerticalSizedBox(height: 30),
            Column(
              children: <Widget>[
                CustomText(
                    textAlign: TextAlign.center,
                    text: description!,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: ColorApp.white)
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
            color: ColorApp.purple,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: <Widget>[
                  VerticalSizedBox(height: 30),
                  Container(
                    height: 500.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPages = page;
                        });
                      },
                      children: <Widget>[
                        buildColumn(
                            images:
                                'https://images.pexels.com/photos/913215/pexels-photo-913215.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            number: 1),
                        buildColumn(
                            images:
                                'https://images.pexels.com/photos/540518/pexels-photo-540518.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            number: 2),
                        buildColumn(
                            images:
                                'https://images.pexels.com/photos/572897/pexels-photo-572897.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                            number: 3),
                      ],
                    ),
                  ),
                  _currentPages == _numPages - 1
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          child: CustomButton(
                            borderRadius: 50,
                            color: ColorApp.white,
                            onPressed: () {
                              context.pushNamed(SignUp.signUpRoute);
                            },
                            text: "START",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(''),
                  VerticalSizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
