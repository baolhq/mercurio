import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile(
      {Key? key,
      required this.index,
      this.extent,
      this.backgroundColor,
      this.bottomSpace,
      this.child})
      : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      height: extent,
      child: this.child,
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
