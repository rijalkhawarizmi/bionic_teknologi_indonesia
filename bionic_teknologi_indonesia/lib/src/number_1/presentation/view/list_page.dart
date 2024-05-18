import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/widgets/clippath.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/list_page2.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/view/signup_page.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/core/style/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  static const String listRoute = "list-route";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 100) / 4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Column(
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  VerticalSizedBox(height: 60),
                  CustomText(
                      text: "Daftar Catatan",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.black),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: ()=>context.pushNamed(ListPage2.list2Route),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorApp.orange),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Title number $index",
                                            color: ColorApp.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CustomText(
                                            text: "Description number $index",
                                            color: ColorApp.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: ColorApp.purple),
                                        child: const Icon(
                                          Icons.note_alt_sharp,
                                          color: ColorApp.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorApp.black,
        selectedLabelStyle: const TextStyle(color: ColorApp.purple),
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: ColorApp.purple,
            ),
            icon: Icon(
              Icons.home,
              color: ColorApp.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: ColorApp.purple,
            ),
            icon: Icon(
              Icons.search,
              color: ColorApp.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.person_outline_outlined, color: ColorApp.purple),
            icon: Icon(Icons.person, color: ColorApp.black),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: ColorApp.purple,
      ),
    );
  }
}
