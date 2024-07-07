import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shop/screens/cart/componets/CartList.dart';
import 'package:provider_shop/screens/cart/componets/CartTotal.dart';

class Cart extends StatelessWidget{
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white
      ),
      body: Container(
        color: Colors.yellow,
        child: const Column(
          children: [
            Expanded(child: Padding(
              padding: EdgeInsets.all(32),
              child: CartList(),
            )),
            Divider(height: 4, color: Colors.black),
            CartTotal()
          ],
        ),
      ),
    );
  }
}
