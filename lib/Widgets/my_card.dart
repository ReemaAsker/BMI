import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, this.onTap, required this.child}) : super(key: key);
  final Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
        ),
        child: child,
      ),
    );
  }
}
