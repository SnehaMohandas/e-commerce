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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value == true) {
        NavigationController navigationController =
            Get.put(NavigationController());
        return Scaffold(
          body: Center(
            child: _pages.elementAt(navigationController.currentIndex.value),
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontFamily: "Roboto"),
                unselectedLabelStyle: TextStyle(fontFamily: "Roboto"),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.vertical_distribute),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/offer_icon.png")),
                    label: 'Offers',
                  ),
                  BottomNavigationBarItem(
                    icon: Stack(children: [
                      Icon(Icons.shopping_cart_rounded),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: ColorConstant.primaryColor,
                          child: Text(
                            "1",
                            style: TextStyle(
                                color: ColorConstant.white, fontSize: 9),
                          ),
                        ),
                      )
                    ]),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
                currentIndex: navigationController.currentIndex.value,
                selectedItemColor: ColorConstant.primaryColor,
                unselectedItemColor: Colors.black38,
                onTap: navigationController.changeTabIndex,
              )),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
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
