import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/feature/type.dart';

class DropDownItems extends StatefulWidget {
  final List items;
  final void Function(TypeDropDown, dynamic) filter;
  final TypeDropDown typeDropDown;
  DropDownItems({this.items, this.filter, this.typeDropDown});

  @override
  _DropDownItemsState createState() => _DropDownItemsState(items: items, filter: filter, typeDropDown: typeDropDown);
}

class _DropDownItemsState extends State<DropDownItems> {
  final List items;
  final void Function(TypeDropDown, dynamic) filter;
  final TypeDropDown typeDropDown;

  _DropDownItemsState({this.items, this.filter, this.typeDropDown});

  String _dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      margin: EdgeInsets.only(left: 8.0),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isDense: true,
              hint: Text('No Filter'),
              elevation: 10,
              value: _dropdownValue,
              items: items.map((it) {
                return new DropdownMenuItem(
                    value: it,
                    child: Wrap(children: <Widget>[Text(it.toString())])
                );
              }).toList(),
              onChanged: (it) {
                filter(typeDropDown, it);
                setState(() {
                  _dropdownValue = it;
                });
              }
          ),
        ),
      ),
    );
  }
}

