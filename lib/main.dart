
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/CatalogModel.dart';
import 'package:provider_shop/models/cart.dart';
import 'package:provider_shop/screens/cart/cart.dart';
import 'package:provider_shop/screens/catalog/catalog.dart';
import 'package:provider_shop/screens/login/login.dart';

final appTheme = ThemeData(
  colorSchemeSeed: Colors.yellow,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


GoRouter router(){
  return GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(
          path: "/login",
          builder: (context, state) => Login(),
       ),
      GoRoute(
        path: "/catalog",
        builder: (context, state) =>  const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) =>  const Cart(),
          )
        ],
      )
    ],
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
              create: (context) => CartModel(),
              update: (context, catalog, cart){
                if (cart == null) throw ArgumentError.notNull('cart');
                cart.catalog = catalog;
                return cart;
              },
          )
        ],
        child: MaterialApp.router(
            title: "Demo App",
            theme: appTheme,
            routerConfig: router(),
            debugShowCheckedModeBanner: false
        )
    );
  }

}

