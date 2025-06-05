import 'package:flutter/material.dart';
import 'package:my_project/pages/details/product_detail_page.dart';
import 'package:my_project/pages/explore/explore_page.dart';
// import 'package:my_project/pages/product_detail/product_detail_page.dart';
// import 'package:my_project/pages/categories/categories_list_page.dart';
import 'package:my_project/pages/cart/cart_page.dart';
import 'package:my_project/pages/favorite/favorite_page.dart';
// import 'package:my_project/pages/account/input_phone_page.dart';
// import 'package:my_project/pages/account/otp_page.dart';
// import 'package:my_project/pages/account/register_location_page.dart';
// import 'package:my_project/pages/payment/payment_success_page.dart';
// import 'package:my_project/pages/payment/payment_failed_page.dart';
// import 'package:my_project/pages/account/account_page.dart';
// import 'package:my_project/pages/payment/promotion_code_page.dart';
// import 'package:my_project/pages/payment/payment_method_page.dart';
// import 'package:my_project/pages/account/my_personal_details_page.dart';

class AppRoutes {
  static const String explore = '/explore';
  static const String productDetail = '/product-detail';
  static const String categoriesList = '/categories-list';
  static const String cart = '/cart';
  static const String favorite = '/favorite';
  static const String inputPhone = '/input-phone';
  static const String otp = '/otp';
  static const String registerLocation = '/register-location';
  static const String paymentSuccess = '/payment-success';
  static const String paymentFailed = '/payment-failed';
  static const String account = '/account';
  static const String promotionCode = '/promotion-code';
  static const String paymentMethod = '/payment-method';
  static const String myPersonalDetails = '/my-personal-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case explore:
        return MaterialPageRoute(builder: (_) => const ExplorePage());
      case productDetail:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());
      case categoriesList:
        // return MaterialPageRoute(builder: (_) => const CategoriesListPage());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoritePage());
      case inputPhone:
        // return MaterialPageRoute(builder: (_) => const InputPhonePage());
      case otp:
        // return MaterialPageRoute(builder: (_) => const OTPPage());
      case registerLocation:
        // return MaterialPageRoute(builder: (_) => const RegisterLocationPage());
      case paymentSuccess:
        // return MaterialPageRoute(builder: (_) => const PaymentSuccessPage());
      case paymentFailed:
        // return MaterialPageRoute(builder: (_) => const PaymentFailedPage());
      case account:
        // return MaterialPageRoute(builder: (_) => const AccountPage());
      case promotionCode:
        // return MaterialPageRoute(builder: (_) => const PromotionCodePage());
      case paymentMethod:
        // return MaterialPageRoute(builder: (_) => const PaymentMethodPage());
      case myPersonalDetails:
        // return MaterialPageRoute(builder: (_) => const MyPersonalDetailsPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
