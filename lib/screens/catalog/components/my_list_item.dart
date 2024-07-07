import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/models/CatalogModel.dart';
import 'package:provider_shop/screens/catalog/components/add_button.dart';

class MyListItem extends StatelessWidget{

  final int index;

  const MyListItem(this.index, {super.key});


  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
        (catalog) => catalog.getByPosition(index)
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Container(
                    color: item.color
                ),
            ),
            const SizedBox(width: 24),
            Expanded(
                child: Text(item.name, style: textTheme)
            ),
            AddButton(item: item)
          ],
        ),
      )
    );
  }

}