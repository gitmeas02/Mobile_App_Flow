import 'package:flutter/material.dart';

// Import from features (we'll create these next)
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/explore/presentation/pages/explore_page.dart';
import '../../features/details/presentation/pages/product_detail_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/favorite/presentation/pages/favorite_page.dart';
import '../../features/home/presentation/pages/main_screen.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String productDetail = '/product-detail';
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
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case explore:
        return MaterialPageRoute(builder: (_) => const ExplorePage());
      case productDetail:
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoritePage());
      // TODO: Implement remaining routes as we move pages to features
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text('Route Not Found')),
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
