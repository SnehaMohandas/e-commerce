import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/Views/Home/home_screen.dart';
import 'package:hexeam_test/network_controller.dart';

import 'package:hexeam_test/utils/color_const.dart';
import 'navigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    const Page2(title: "Categories"),
    const Page2(title: "Offers"),
    const Page2(
      title: "Cart",
    ),
    const Page2(
      title: "Account",
    ),
  ];
  final NetworkController networkController = Get.put(NetworkController());
  var navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (networkController.isConnected.value) {
          return Center(
            child: _pages.elementAt(navigationController.currentIndex.value),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontFamily: "Roboto"),
            unselectedLabelStyle: TextStyle(fontFamily: "Roboto"),

            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.vertical_distribute),
                label: 'Categories',
              ),
              const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/offer_icon.png")),
                label: 'Offers',
              ),
              const BottomNavigationBarItem(
                icon: Stack(children: [
                  Icon(Icons.shopping_cart_rounded),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 7,
                      child: Text(
                        "1",
                        style:
                            TextStyle(color: ColorConstant.white, fontSize: 9),
                      ),
                      backgroundColor: ColorConstant.primaryColor,
                    ),
                  )
                ]),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            currentIndex: navigationController
                .currentIndex.value, // Use controller's index
            selectedItemColor: ColorConstant.primaryColor,
            unselectedItemColor: Colors.black38,
            onTap: navigationController
                .changeTabIndex, // Update the index through controller
          )),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.offAll(() => BottomNavigation());
      },
      child: Scaffold(
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
