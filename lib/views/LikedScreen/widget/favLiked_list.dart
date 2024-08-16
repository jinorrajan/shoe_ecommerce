// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../utlis/colors.dart';

// ignore: must_be_immutable
class FavLikedListText extends StatelessWidget {
  String text;

  FavLikedListText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: CosColors().thirdTextColor, fontWeight: FontWeight.w500),
    );
  }
}