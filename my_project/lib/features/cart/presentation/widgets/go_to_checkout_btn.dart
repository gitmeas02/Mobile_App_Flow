import 'package:flutter/material.dart';

class GoToCheckoutBtn extends StatelessWidget {
  final double total;
  const GoToCheckoutBtn({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,  // full width
      height: 67,              // adjust as needed
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 23,vertical: 18)
        ),
        onPressed: () {
          // Your checkout logic here
        },
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
          "Go to Checkout",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 22,
          width: 49,
          child: Text('\$${total.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.white, fontSize:12 ,
          backgroundColor: Color(0xFF489E67)),)
          )
          ],
        )
      ),
    );
  }
}
