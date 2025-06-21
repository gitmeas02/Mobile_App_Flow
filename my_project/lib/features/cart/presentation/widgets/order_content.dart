import 'package:flutter/material.dart';
import 'track_order_button.dart';
import 'back_to_home_button.dart';

class OrderContent extends StatelessWidget {
  final VoidCallback onTrackOrder;
  final VoidCallback onBackToHome;

  const OrderContent({
    super.key,
    required this.onTrackOrder,
    required this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Your Order has been',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFF2C2C2C),
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'accepted',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFF2C2C2C),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Your items has been placed and is on\nit\'s way to being processed',
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
              color: Color(0xFF757575),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TrackOrderButton(onPressed: onTrackOrder),
          const SizedBox(height: 16),
          BackToHomeButton(onPressed: onBackToHome),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
