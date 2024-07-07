import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/cart.dart';

class CartTotal extends StatelessWidget{
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder:(context, cart, child) => Text('\$${cart.totalPrice}', style: hugeStyle)
            ),
            const SizedBox(width: 24),
            FilledButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text("Buy")
            )
          ],
        ),
      ),
    );

  }

}