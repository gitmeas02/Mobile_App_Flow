// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_project/pages/account/account_page.dart';
import 'package:my_project/pages/cart/cart_page.dart';
import 'package:my_project/pages/details/product_detail_page.dart';
// import 'package:my_project/pages/details/product_detail_page.dart';
import 'package:my_project/pages/explore/explore_page.dart';
import 'package:my_project/pages/favorite/favorite_page.dart';
import 'package:my_project/pages/home/home_screen.dart';
import 'package:my_project/routers/routers_.dart';
import 'package:my_project/theme/colors.dart';
import 'package:my_project/theme/theme.dart';
// import 'package:my_project/pages/details/product_detail_screen.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lesson 1',
      theme: AppTheme.defaultTheme,
      home:  MainScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExplorePage(),
    const CartPage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    // Remove splash after delay
    Future.delayed(const Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppPallete.secondaryColor,
            unselectedItemColor: Colors.blueGrey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
