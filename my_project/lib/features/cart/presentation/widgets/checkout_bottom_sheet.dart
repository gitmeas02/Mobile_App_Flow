import 'package:flutter/material.dart';
import 'package:my_project/features/cart/presentation/widgets/go_to_checkout_btn.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final double total;
  const CheckoutBottomSheet({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.maxFinite, // adjust height as needed
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Checkout"),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          //Payments
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Delivery"),
              Row(
                children: [
                  Text("Select Methods"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
                ],
              ),
            ],
          ),
          // Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Payment"),
              Row(
                children: [
                  Text("Card"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
                ],
              ),
            ],
          ),
          //Promo code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Promo Code"),
              Row(
                children: [
                  Text("Pick Discount"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
                ],
              ),
            ],
          ),
          //Total Cost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Total Cost"),
              Row(
                children: [
                  Text('\$123'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "By placing an order you agree to our\nTerms And Conditions",
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\nHome", style: TextStyle(fontSize: 14)),
                  Text("Profile", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          SizedBox(height: 21),
          Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // background color
                  foregroundColor: Colors.white, // text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  "Place order",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
