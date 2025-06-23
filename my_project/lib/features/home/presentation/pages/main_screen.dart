import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../explore/presentation/pages/explore_page.dart';
import '../../../favorite/presentation/pages/favorite_page.dart';
import 'home_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExplorePage(),
    CartPage(),
    FavoritePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final cartCount = ref.watch(cartCountProvider);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
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
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor: Colors.blueGrey,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon:
                    cartCount > 0
                        ? Badge(
                          label: Text(cartCount.toString()),
                          backgroundColor: const Color(0xFF53B175),
                          textColor: Colors.white,
                          child: const Icon(Icons.shopping_bag),
                        )
                        : const Icon(Icons.shopping_bag),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
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
