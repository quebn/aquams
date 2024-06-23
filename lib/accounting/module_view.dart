import "package:flutter/material.dart";

// returns a Module object containing the view of accounting module:
// stuff like list of master and documents under accounting

Widget accountingModule(BuildContext context){
  final ThemeData theme = Theme.of(context);
  return Center(
    child: Text(
      "Accounting Module",
      style: theme.textTheme.titleLarge,
    ),
  );
}
