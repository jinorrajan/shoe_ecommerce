
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customAppbar extends StatelessWidget {
  Color? color;

  customAppbar({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 13),
          child: IconButton(
              iconSize: 43,
              onPressed: () {
                
              },
              icon: Icon(
                Icons.dehaze,
                color: color,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, right: 25),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(13, 216, 227, 1),
            radius: 28,
            child: Image.asset("assets/profile.png"),
          ),
        ),
      ],
    );
  }
}
