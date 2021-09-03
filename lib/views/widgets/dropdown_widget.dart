import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final Widget child;

  DropdownWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 15),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Theme.of(context).buttonColor.withOpacity(0.1),
        ),
        child: ButtonTheme(alignedDropdown: true, child: child));
  }
}
