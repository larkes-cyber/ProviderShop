import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/cart.dart';

import '../../../models/CatalogModel.dart';

class AddButton extends StatelessWidget{

  final Item item;

  const AddButton({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
            (cart) => cart.items.contains(item)
    );

    return TextButton(
        onPressed: isInCart ? null : (){
          var cart = context.read<CartModel>();
          cart.add(item);
        },
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD')
    );
  }

}