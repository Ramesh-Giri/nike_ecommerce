import 'package:flutter/material.dart';


class SliderItem extends StatelessWidget {
  final String image;

  SliderItem({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -100,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.scaleDown,
          height: 300.0,
          width: 300.0,
        ),
      ),
    );
  }
}
