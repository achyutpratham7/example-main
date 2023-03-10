import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  String? text;
  IconData? iconData;
  IconData? iconData1;

  CustomListtile({
    super.key,
    required this.width,
    required this.text,
    required this.iconData,
    required this.iconData1,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.065,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade100),
              child: Icon(iconData),
            ),
            title: Text(
              "$text",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            trailing: Icon(iconData1)),
      ),
    );
  }
}
