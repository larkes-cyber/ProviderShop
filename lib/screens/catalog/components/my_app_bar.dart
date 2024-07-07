import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Catalog", style: Theme.of(context).textTheme.displayLarge,),
      floating: true,
      actions: [
        IconButton(onPressed: (){
          context.go("/catalog/cart");
        },
            icon: const Icon(Icons.shopping_cart)
        )
      ],
    );
  }
}
