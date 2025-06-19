import 'package:flutter/material.dart';
import 'package:my_project/features/cart/data/model/card_model.dart';
import 'package:my_project/features/cart/presentation/widgets/cart_widget.dart';
import 'package:my_project/features/cart/presentation/widgets/go_to_checkout_btn.dart';

class CartPage extends StatefulWidget {
  
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("My Card")),
      body: 
        ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: cartItems.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return CartWidget(item:cartItems[index]);
        },
      ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GoToCheckoutBtn(total: 12,),
      ),
    );
  }
}
