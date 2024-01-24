import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final TextEditingController controllerItem;
  final String? labelItem;
  final String? hintItem;
  final IconData? iconItem;

  //FormItem({super.key, required TextEditingController controllerItem});

  FormItem(
      {required this.controllerItem,
      this.labelItem,
      this.hintItem,
      this.iconItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controllerItem,
        decoration: InputDecoration(
          icon: Icon(iconItem),
          labelText: labelItem,
          hintText: hintItem,
        ),
      ),
    );
  }
}
