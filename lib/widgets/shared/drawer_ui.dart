import 'package:flutter/material.dart';

class DrawerUI extends StatelessWidget {
  const DrawerUI({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: child,
    );
  }
}
