import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  int status;
  List<FeaturedCategory> featuredCategories;
  List<FeaturedCategory> featuredCategoriesProducts;
  List<dynamic> flashProducts;
  String flashsaleEndTime;
  List<dynamic> dealOfDayProducts;
  List<HomeSlider> homeSliders;
  String branchName;
  String cityName;
  String message;
  String productImagePath;
  String bannerImagePath;
  String categoryImagePath;
  String defaultImage;

  HomeModel({
    required this.status,
    required this.featuredCategories,
    required this.featuredCategoriesProducts,
    required this.flashProducts,
    required this.flashsaleEndTime,
    required this.dealOfDayProducts,
    required this.homeSliders,
    required this.branchName,
    required this.cityName,
    required this.message,
    required this.productImagePath,
    required this.bannerImagePath,
    required this.categoryImagePath,
    required this.defaultImage,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        featuredCategories: List<FeaturedCategory>.from(
            json["Featured_categories"]
                .map((x) => FeaturedCategory.fromJson(x))),
        featuredCategoriesProducts: List<FeaturedCategory>.from(
            json["Featured_categories_products"]
                .map((x) => FeaturedCategory.fromJson(x))),
        flashProducts: List<dynamic>.from(json["flash_products"].map((x) => x)),
        flashsaleEndTime: json["flashsale_end_time"],
        dealOfDayProducts:
            List<dynamic>.from(json["deal_of_day_products"].map((x) => x)),
        homeSliders: List<HomeSlider>.from(
            json["home_sliders"].map((x) => HomeSlider.fromJson(x))),
        branchName: json["branch_name"],
        cityName: json["city_name"],
        message: json["message"],
        productImagePath: json["product_image_path"],
        bannerImagePath: json["banner_image_path"],
        categoryImagePath: json["category_image_path"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Featured_categories":
            List<dynamic>.from(featuredCategories.map((x) => x.toJson())),
        "Featured_categories_products": List<dynamic>.from(
            featuredCategoriesProducts.map((x) => x.toJson())),
        "flash_products": List<dynamic>.from(flashProducts.map((x) => x)),
        "flashsale_end_time": flashsaleEndTime,
        "deal_of_day_products":
            List<dynamic>.from(dealOfDayProducts.map((x) => x)),
        "home_sliders": List<dynamic>.from(homeSliders.map((x) => x.toJson())),
        "branch_name": branchName,
        "city_name": cityName,
        "message": message,
        "product_image_path": productImagePath,
        "banner_image_path": bannerImagePath,
        "category_image_path": categoryImagePath,
        "default_image": defaultImage,
      };
}

class FeaturedCategory {
  int itemCategoryId;
  String categoryName;
  String categoryNameSlug;
  String categoryIcon;
  String categoryDescription;
  int isActive;
  int addedToHome;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<BranchProductVarient>? branchProductVarients;

  FeaturedCategory({
    required this.itemCategoryId,
    required this.categoryName,
    required this.categoryNameSlug,
    required this.categoryIcon,
    required this.categoryDescription,
    required this.isActive,
    required this.addedToHome,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.branchProductVarients,
  });

  factory FeaturedCategory.fromJson(Map<String, dynamic> json) =>
      FeaturedCategory(
        itemCategoryId: json["item_category_id"],
        categoryName: json["category_name"],
        categoryNameSlug: json["category_name_slug"],
        categoryIcon: json["category_icon"],
        categoryDescription: json["category_description"],
        isActive: json["is_active"],
        addedToHome: json["added_to_home"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        branchProductVarients: json["branch_product_varients"] == null
            ? []
            : List<BranchProductVarient>.from(json["branch_product_varients"]!
                .map((x) => BranchProductVarient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item_category_id": itemCategoryId,
        "category_name": categoryName,
        "category_name_slug": categoryNameSlug,
        "category_icon": categoryIcon,
        "category_description": categoryDescription,
        "is_active": isActive,
        "added_to_home": addedToHome,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "branch_product_varients": branchProductVarients == null
            ? []
            : List<dynamic>.from(branchProductVarients!.map((x) => x.toJson())),
      };
}

class BranchProductVarient {
  int varientId;
  dynamic sku;
  int productId;
  int branchId;
  String variantName;
  String productVarientPrice;
  String productVarientOfferPrice;
  dynamic productVarientOfferFromDate;
  dynamic productVarientOfferToDate;
  String productVarientBaseImage;
  dynamic attrGroupId;
  dynamic attrValueId;
  int stockCount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int isRemoved;
  int isBaseVariant;
  int didUMissMe;
  int laravelThroughKey;
  int globalProductId;
  int inWishlist;
  int foodType;
  int inCart;
  int cartItemQuantity;

  BranchProductVarient({
    required this.varientId,
    required this.sku,
    required this.productId,
    required this.branchId,
    required this.variantName,
    required this.productVarientPrice,
    required this.productVarientOfferPrice,
    required this.productVarientOfferFromDate,
    required this.productVarientOfferToDate,
    required this.productVarientBaseImage,
    required this.attrGroupId,
    required this.attrValueId,
    required this.stockCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isRemoved,
    required this.isBaseVariant,
    required this.didUMissMe,
    required this.laravelThroughKey,
    required this.globalProductId,
    required this.inWishlist,
    required this.foodType,
    required this.inCart,
    required this.cartItemQuantity,
  });

  factory BranchProductVarient.fromJson(Map<String, dynamic> json) =>
      BranchProductVarient(
        varientId: json["varient_id"],
        sku: json["SKU"],
        productId: json["product_id"],
        branchId: json["branch_id"],
        variantName: json["variant_name"],
        productVarientPrice: json["product_varient_price"],
        productVarientOfferPrice: json["product_varient_offer_price"],
        productVarientOfferFromDate: json["product_varient_offer_from_date"],
        productVarientOfferToDate: json["product_varient_offer_to_date"],
        productVarientBaseImage: json["product_varient_base_image"],
        attrGroupId: json["attr_group_id"],
        attrValueId: json["attr_value_id"],
        stockCount: json["stock_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        isRemoved: json["is_removed"],
        isBaseVariant: json["is_base_variant"],
        didUMissMe: json["did_u_miss_me"],
        laravelThroughKey: json["laravel_through_key"],
        globalProductId: json["global_product_id"],
        inWishlist: json["in_wishlist"],
        foodType: json["food_type"],
        inCart: json["in_cart"],
        cartItemQuantity: json["cart_item_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "varient_id": varientId,
        "SKU": sku,
        "product_id": productId,
        "branch_id": branchId,
        "variant_name": variantName,
        "product_varient_price": productVarientPrice,
        "product_varient_offer_price": productVarientOfferPrice,
        "product_varient_offer_from_date": productVarientOfferFromDate,
        "product_varient_offer_to_date": productVarientOfferToDate,
        "product_varient_base_image": productVarientBaseImage,
        "attr_group_id": attrGroupId,
        "attr_value_id": attrValueId,
        "stock_count": stockCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "is_removed": isRemoved,
        "is_base_variant": isBaseVariant,
        "did_u_miss_me": didUMissMe,
        "laravel_through_key": laravelThroughKey,
        "global_product_id": globalProductId,
        "in_wishlist": inWishlist,
        "food_type": foodType,
        "in_cart": inCart,
        "cart_item_quantity": cartItemQuantity,
      };
}

class HomeSlider {
  int customerBannerId;
  String heading;
  String content;
  String customerBanner;
  dynamic link;
  int isDefault;
  int isActive;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  HomeSlider({
    required this.customerBannerId,
    required this.heading,
    required this.content,
    required this.customerBanner,
    required this.link,
    required this.isDefault,
    required this.isActive,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        customerBannerId: json["customer_banner_id"],
        heading: json["heading"],
        content: json["content"],
        customerBanner: json["customer_banner"],
        link: json["link"],
        isDefault: json["is_default"],
        isActive: json["is_active"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_banner_id": customerBannerId,
        "heading": heading,
        "content": content,
        "customer_banner": customerBanner,
        "link": link,
        "is_default": isDefault,
        "is_active": isActive,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
