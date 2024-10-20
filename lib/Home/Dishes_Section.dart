/*
* Inside Dish Section We Have A ListView Builder Which Contain Horizontal Dish Section
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DishesSection extends StatefulWidget {
  const DishesSection({super.key});

  @override
  State<DishesSection> createState() => _DishesSectionState();
}

class _DishesSectionState extends State<DishesSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item '),
        );
      },
    ));
  }
}
