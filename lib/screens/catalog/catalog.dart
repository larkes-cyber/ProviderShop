
import 'package:flutter/material.dart';
import 'package:provider_shop/screens/catalog/components/my_list_item.dart';
import 'components/my_app_bar.dart';

class MyCatalog extends StatelessWidget{
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => MyListItem(index)
            )
          )
        ]
      )
    );
  }
}

