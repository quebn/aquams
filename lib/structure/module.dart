import "package:flutter/material.dart";


class Module {
  final String name;
  final List<String> docs = const[];

  const Module(this.name);

  Widget getView(bool selected){
    return ListTile(
      title: Text(name),
      selected: selected,
      leading: _getIcon("outline"),
      selectedColor: Colors.black,
      selectedTileColor: Colors.blue,
    );
  }

  Widget? _getIcon(String icon){
    if (!_moduleIcons.containsKey(name)){
      return _moduleIcons["Default"]?[icon];
    }
    return _moduleIcons[name]?[icon];
  }
}


const Map<String, Map<String, Widget>> _moduleIcons = {
  "Area": {
    "selected": Icon(Icons.water_rounded),
    "outline": Icon(Icons.water_outlined),
  },
  "Accounting": {
    "selected": Icon(Icons.book_rounded),
    "outline": Icon(Icons.book_outlined),
  },
  "Inventory": {
    "selected": Icon(Icons.inventory_2),
    "outline": Icon(Icons.inventory_2_outlined),
  },
  "Purchase": {
    "selected": Icon(Icons.shopping_cart),
    "outline": Icon(Icons.shopping_cart_outlined),
  },
  "Sale": {
    "selected": Icon(Icons.point_of_sale),
    "outline": Icon(Icons.point_of_sale_outlined),
  },
  "HR": {
    "selected": Icon(Icons.groups),
    "outline": Icon(Icons.groups_outlined),
  },
  "Fixed Asset": {
    "selected": Icon(Icons.chair_rounded),
    "outline": Icon(Icons.chair_outlined),
  },
  "Project": {
    "selected": Icon(Icons.assignment),
    "outline": Icon(Icons.assignment_outlined),
  },
  "Default": {
    "selected": Icon(Icons.feed),
    "outline": Icon(Icons.feed_outlined)
  }
};
