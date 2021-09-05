import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownWidget<Object> extends StatelessWidget {
  final Object currentItem;
  final List<Object> itemList;
  final Function(Object) onItemSelected;

  DropdownWidget(
      {Key? key,
      required this.currentItem,
      required this.onItemSelected,
      required this.itemList,
      })
      : super(key: key);

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
        child: ButtonTheme(alignedDropdown: true, child: DropdownButton<Object>(
            value: currentItem,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: Container(),
            iconSize: 24,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            onChanged: (value) => onItemSelected(value!),
            items: itemList.map<DropdownMenuItem<Object>>((Object status) {
              return DropdownMenuItem<Object>(
                value: status,
                child: Text(status.toString()),
              );
            }).toList())));
  }
}
