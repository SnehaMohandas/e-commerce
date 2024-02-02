// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:hexeam_test/Views/Home/home_controller.dart';
// import 'package:hexeam_test/Views/Home/home_model.dart';
// import 'package:hexeam_test/Views/Home/widgets/quantity_widget.dart';
// import 'package:hexeam_test/Views/Shimmer/home_shimmer.dart';
// import 'package:hexeam_test/utils/color_const.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   List cities = ["Koramangala", "India Nagar", "Kalyan Nagar", "Magestic"];
//   @override
//   Widget build(BuildContext context) {
//     var homeController = Get.put(HomeController());

//     return PopScope(
//       canPop: false,
//       onPopInvoked: (didPop) {
//         exitDialogue(context);
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: ColorConstant.primaryColor,
//           title: Row(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width * 0.07,
//                 child: Image.asset(
//                   "assets/images/appbar_logo.png",
//                   color: ColorConstant.white,
//                 ),
//               ),
//               const Text(
//                 "LOREM IPSUM",
//                 style: TextStyle(color: ColorConstant.white, fontSize: 10),
//               )
//             ],
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 30),
//               child: Container(
//                 width: 180,
//                 height: 37,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: ColorConstant.white)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       size: 15,
//                       color: ColorConstant.white,
//                     ),
//                     Obx(
//                       () => Text(
//                         "${homeController.city.value}",
//                         // " Koramangala",
//                         style:
//                             TextStyle(color: ColorConstant.white, fontSize: 12),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Obx(
//           () => homeController.isLoading.value == true
//               ? Center(child: ShimmerHome())
//               : SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 45,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.2),
//                                   spreadRadius: 1,
//                                   blurRadius: 2,
//                                   offset: const Offset(0, 2),
//                                 ),
//                               ],
//                               color: ColorConstant.white),
//                           child: Center(
//                             child: TextFormField(
//                               decoration: const InputDecoration(
//                                   contentPadding: EdgeInsets.all(10),
//                                   border: InputBorder.none,
//                                   hintText: "    Search For Dishes",
//                                   hintStyle: TextStyle(
//                                       fontSize: 14,
//                                       color: ColorConstant.hintColor),
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: ColorConstant.primaryColor,
//                                     size: 28,
//                                   )),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         CarouselSlider(
//                           options: CarouselOptions(
//                               aspectRatio: 18 / 5,
//                               viewportFraction: 1.0,
//                               height: MediaQuery.of(context).size.height * 0.22,
//                               autoPlay: true),
//                           items: homeController.bannerImages.map((e) {
//                             return Builder(builder: (BuildContext context) {
//                               return Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.22,
//                                 width: double.infinity,

//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             "${homeController.homeModel!.bannerImagePath}$e"),
//                                         fit: BoxFit.cover)),
//                                 //child: Image.asset(e.toString())
//                               );
//                             });
//                           }).toList(),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Container(
//                           height: 40,
//                           width: double.infinity,
//                           color: ColorConstant.white,
//                           child: ListView.builder(
//                               itemCount: cities.length,
//                               scrollDirection: Axis.horizontal,
//                               //shrinkWrap: true,
//                               //physics: const NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 4),
//                                     height: 40,
//                                     // width: 70,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         gradient: LinearGradient(
//                                             colors: index % 2 == 0
//                                                 ? [
//                                                     Colors.red,
//                                                     const Color.fromARGB(
//                                                         255, 36, 11, 2),
//                                                   ]
//                                                 : [
//                                                     const Color.fromARGB(
//                                                         255, 36, 11, 2),
//                                                     Colors.red,
//                                                   ])),
//                                     child: Center(
//                                         child: Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 10),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             cities[index],
//                                             style: TextStyle(
//                                                 color: ColorConstant.white),
//                                           ),
//                                           Icon(Icons.navigate_next_outlined,
//                                               color: ColorConstant.white)
//                                         ],
//                                       ),
//                                     )));
//                               }),
//                         ),
//                         ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: homeController
//                                 .homeModel!.featuredCategories.length,
//                             itemBuilder: (context, index) {
//                               var pdts;

//                               var category = homeController
//                                   .homeModel!.featuredCategories[index];
//                               var categoryId = category.itemCategoryId;

//                               // Filter products based on the category id
//                               List<FeaturedCategory> categoryProducts =
//                                   homeController
//                                       .homeModel!.featuredCategoriesProducts
//                                       .where((product) =>
//                                           product.itemCategoryId == categoryId)
//                                       .toList();
//                               if (categoryProducts.isNotEmpty) {
//                                 print(categoryProducts[0]
//                                     .branchProductVarients!
//                                     .length);
//                               }

//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     category.categoryName,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   categoryProducts.isNotEmpty
//                                       ? SizedBox(
//                                           height: 150,
//                                           child: ListView.builder(
//                                               itemCount: categoryProducts[0]
//                                                   .branchProductVarients!
//                                                   .length,
//                                               scrollDirection: Axis.horizontal,
//                                               itemBuilder: (context, subIndex) {
//                                                 //categoryProductss.length;
//                                                 return GestureDetector(
//                                                   onTap: () {
//                                                     print("kkkk${index}");
//                                                     print("oooo${subIndex}");
//                                                   },
//                                                   child: Container(
//                                                     height: 100,
//                                                     margin:
//                                                         const EdgeInsets.all(8),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.amber,
//                                                         image: DecorationImage(
//                                                             image: NetworkImage(
//                                                                 "${homeController.homeModel!.productImagePath}${categoryProducts[0].branchProductVarients![subIndex].productVarientBaseImage}"),
//                                                             fit: BoxFit.cover)),
//                                                     width: 160.0,
//                                                     child: Column(
//                                                       children: [
//                                                         Icon(
//                                                             Icons
//                                                                 .radio_button_checked_rounded,
//                                                             color: categoryProducts[
//                                                                             0]
//                                                                         .branchProductVarients![
//                                                                             subIndex]
//                                                                         .inWishlist ==
//                                                                     1
//                                                                 ? Colors.green
//                                                                 : categoryProducts[0]
//                                                                             .branchProductVarients![
//                                                                                 subIndex]
//                                                                             .inWishlist ==
//                                                                         2
//                                                                     ? Colors.red
//                                                                     : Colors
//                                                                         .yellow),
//                                                         Text(
//                                                           categoryProducts[0]
//                                                               .branchProductVarients![
//                                                                   subIndex]
//                                                               .variantName,
//                                                           style: const TextStyle(
//                                                               color:
//                                                                   ColorConstant
//                                                                       .white),
//                                                         ),
//                                                         AddQuantityContainer(
//                                                             context,
//                                                             index,
//                                                             subIndex)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 );
//                                               }),
//                                         )
//                                       : const Text(
//                                           "Fresh Recipes Brewing. Stay Tuned!"),
//                                   index == 1
//                                       ? CarouselSlider(
//                                           options: CarouselOptions(
//                                               aspectRatio: 18 / 5,
//                                               viewportFraction: 1.0,
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.18,
//                                               autoPlay: true),
//                                           items: homeController.bannerImages
//                                               .map((e) {
//                                             return Builder(builder:
//                                                 (BuildContext context) {
//                                               return Container(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 width: double.infinity,

//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     image: DecorationImage(
//                                                         image: NetworkImage(
//                                                             "${homeController.homeModel!.bannerImagePath}$e"),
//                                                         fit: BoxFit.cover)),
//                                                 //child: Image.asset(e.toString())
//                                               );
//                                             });
//                                           }).toList(),
//                                         )
//                                       : SizedBox(),
//                                 ],
//                               );
//                               // );
//                             })
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
//=============================

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexeam_test/Views/Home/home_controller.dart';
import 'package:hexeam_test/Views/Home/home_model.dart';
import 'package:hexeam_test/Views/Home/widgets/quantity_widget.dart';
import 'package:hexeam_test/Views/Shimmer/home_shimmer.dart';
import 'package:hexeam_test/network_controller.dart';
import 'package:hexeam_test/utils/color_const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List images = [
    "https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg",
    "https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?cs=srgb&dl=pexels-pixabay-258154.jpg&fm=jpg"
  ];
  List cities = ["Koramangala", "India Nagar", "Kalyan Nagar", "Magestic"];
  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitDialogue(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          title: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.07,
                child: Image.asset(
                  "assets/images/appbar_logo.png",
                  color: ColorConstant.white,
                ),
              ),
              const Text(
                "LOREM IPSUM",
                style: TextStyle(color: ColorConstant.white, fontSize: 10),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                width: 180,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorConstant.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 15,
                      color: ColorConstant.white,
                    ),
                    Obx(
                      () => Text(
                        "${homeController.city.value}",
                        // " Koramangala",
                        style: const TextStyle(
                            color: ColorConstant.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () => homeController.isLoading.value == true
              ? ShimmerHome()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  color: ColorConstant.white),
                              child: Center(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(7),
                                      border: InputBorder.none,
                                      hintText: "    Search For Dishes",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: ColorConstant.hintColor),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: ColorConstant.primaryColor,
                                        size: 28,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  aspectRatio: 18 / 5,
                                  viewportFraction: 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  autoPlay: true),
                              items: homeController.bannerImages.map((e) {
                                return Builder(builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${homeController.homeModel!.bannerImagePath}$e"),
                                            fit: BoxFit.cover)),
                                  );
                                });
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 8),
                            child: SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ListView.builder(
                                  itemCount: cities.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 40,
                                        // width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: LinearGradient(
                                            colors: index % 2 == 0
                                                ? [
                                                    const Color.fromARGB(
                                                        255, 223, 20, 6),
                                                    const Color.fromARGB(
                                                        255, 36, 11, 2),
                                                  ]
                                                : [
                                                    const Color.fromARGB(
                                                        255, 36, 11, 2),
                                                    const Color.fromARGB(
                                                        255, 223, 20, 6),
                                                  ],
                                          ),
                                        ),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                cities[index],
                                                style: const TextStyle(
                                                    color: ColorConstant.white),
                                              ),
                                              const Icon(
                                                  Icons.navigate_next_outlined,
                                                  color: ColorConstant.white)
                                            ],
                                          ),
                                        )));
                                  }),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeController
                                  .homeModel!.featuredCategories.length,
                              itemBuilder: (context, index) {
                                var category = homeController
                                    .homeModel!.featuredCategories[index];
                                var categoryId = category.itemCategoryId;

                                List<FeaturedCategory> categoryProducts =
                                    homeController
                                        .homeModel!.featuredCategoriesProducts
                                        .where((product) =>
                                            product.itemCategoryId ==
                                            categoryId)
                                        .toList();
                                if (categoryProducts.isNotEmpty) {}
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            category.categoryName,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          categoryProducts.isEmpty
                                              ? const SizedBox()
                                              : Container(
                                                  height: 30,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              255, 223, 20, 6),
                                                          Color.fromARGB(
                                                              255, 36, 11, 2),
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: const Center(
                                                    child: Text(
                                                      'View All',
                                                      style: TextStyle(
                                                          fontFamily: "Roboto",
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                    categoryProducts.isEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 200,
                                                  width: 170.0,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: const DecorationImage(
                                                          image: NetworkImage(
                                                              "https://qul.imgix.net/c0ceec9e-3a9d-47bf-ae63-164a8d5e5a30/606100_sld.jpg"),
                                                          fit: BoxFit.cover),
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Colors.black38,
                                                            Colors.black54
                                                          ])),
                                                ),
                                                Container(
                                                  height: 200,
                                                  width: 170.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black45
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "Fresh Recipes Brewing. Stay Tuned!\n ",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .white,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            height: 200.0,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: categoryProducts[0]
                                                  .branchProductVarients!
                                                  .length,
                                              itemBuilder: (context, subIndex) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 6),
                                                  child: Container(
                                                    height: 250,
                                                    width: 132.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          spreadRadius: 1,
                                                          blurRadius: 2,
                                                          offset: const Offset(
                                                              0, 2),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          "${homeController.homeModel!.productImagePath}${categoryProducts[0].branchProductVarients![subIndex].productVarientBaseImage}",
                                                        ),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                      Icons
                                                                          .radio_button_checked_rounded,
                                                                      color: categoryProducts[0].branchProductVarients![subIndex].inWishlist ==
                                                                              1
                                                                          ? Colors
                                                                              .green
                                                                          : categoryProducts[0].branchProductVarients![subIndex].inWishlist == 2
                                                                              ? Colors.red
                                                                              : Colors.yellow))
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .black45
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius: const BorderRadius
                                                                  .vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          15))),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        2,
                                                                    vertical:
                                                                        3),
                                                                child: Text(
                                                                  categoryProducts[
                                                                          0]
                                                                      .branchProductVarients![
                                                                          subIndex]
                                                                      .variantName,
                                                                  maxLines: 2,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 1.2,
                                                                    color: ColorConstant
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                categoryProducts[
                                                                        0]
                                                                    .categoryName,
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1.2,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        3,
                                                                    vertical:
                                                                        8),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      ' ₹ ${categoryProducts[0].branchProductVarients![subIndex].productVarientOfferPrice}',
                                                                      maxLines:
                                                                          2,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        height:
                                                                            1.2,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    index == 0
                                                                        ? AddQuantityContainer(
                                                                            context)
                                                                        : const Icon(
                                                                            Icons.shopping_cart,
                                                                            size:
                                                                                18,
                                                                            color:
                                                                                ColorConstant.primaryColor,
                                                                          )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                    index == 1
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CarouselSlider(
                                              options: CarouselOptions(
                                                  aspectRatio: 18 / 5,
                                                  viewportFraction: 1.0,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.17,
                                                  autoPlay: true),
                                              items: homeController.bannerImages
                                                  .map((e) {
                                                return Builder(builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.17,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "${homeController.homeModel!.bannerImagePath}$e"),
                                                            fit: BoxFit.cover)),
                                                  );
                                                });
                                              }).toList(),
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                );
                              })
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

exitDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text('Are you sure to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.primaryColor,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: ColorConstant.white,
                ),
              ))
        ],
      );
    },
  );
}
