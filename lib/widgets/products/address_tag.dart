import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget{
  final String address;
  AddressTag(this.address);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.all(5),
        child: Text(address)
    );
  }
}