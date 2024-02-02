import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/utils/color_const.dart';

import '../home_controller.dart';

Widget AddQuantityContainer(BuildContext context) {
  var homeController = Get.find<HomeController>();

  return Container(
    width: MediaQuery.of(context).size.width * 0.14,
    height: MediaQuery.of(context).size.height * 0.028,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.052,
            width: MediaQuery.of(context).size.width * 0.052,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstant.primaryColor,
            ),
            child: const Icon(
              Icons.delete_outline,
              size: 15,
              color: ColorConstant.white,
            ),
          ),
          const Text(
            "1",
            style: TextStyle(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * 0.052,
              width: MediaQuery.of(context).size.width * 0.052,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.primaryColor,
              ),
              child: const Icon(
                Icons.add,
                size: 15,
                color: ColorConstant.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
