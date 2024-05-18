import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/src/number_1/presentation/widgets/clippath.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:bionic_teknologi_indonesia/core/style/sized_box.dart';
import 'package:flutter/material.dart';

class ListPage2 extends StatefulWidget {
  const ListPage2({super.key});

  static const String list2Route = "list2-route";

  @override
  State<ListPage2> createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  int? thisIndex;
  List<String> profile = [
    "Nama lengkap",
    "Tempta/Tanggal Lahir",
    "No telepon",
    "Alamat lengkap",
    "Alamat lengkap",
    "Catatan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              width: MediaQuery.of(context)
                  .size
                  .width, // Adjust the width as needed
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
                child: ListView(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.only(left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorApp.grey),
                          color: ColorApp.orange,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(29),topRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 50,
                            color: ColorApp.white,
                          ),
                          HorizontalSizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "Lorem Name",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.white),
                              CustomText(
                                  text: "Lorem Ipsum",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: ColorApp.white)
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: profile.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                thisIndex = index;
                              });
                            },
                            child: Container(
                                height: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                margin:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorApp.grey),
                                    color: thisIndex == index
                                        ? ColorApp.orange
                                        : ColorApp.purple,
                                    borderRadius: BorderRadius.circular(2)),
                                child: Center(
                                  child: CustomText(
                                    text:profile[index],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorApp.white),
                                ),),
                          );
                        },
                      ),
                    ),
                  ],
                )),
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

  Widget makecontainer(String value, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          thisIndex = index;
        });
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(left: 10, bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(color: ColorApp.grey),
            color: thisIndex == index ? ColorApp.orange : ColorApp.purple,
            borderRadius: BorderRadius.circular(2)),
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: 50,
            ),
            HorizontalSizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: value,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.white),
                CustomText(
                    text: "Lorem Ipsum",
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: ColorApp.white)
              ],
            )
          ],
        ),
      ),
    );
  }
}
