// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {

  String Btext;
   VoidCallback? onPressed; 

  IconData? BIcon;

  double Bheight;

  double bWidth;

  double? btextFontSize;

  double? bIconSize;

  double? rowCap;
  
  double bRadious;

  ButtonWidget({
    Key? key,
    required this.Btext,
    this.onPressed, 
    this.BIcon,
    required this.Bheight,
    required this.bWidth,
    this.btextFontSize,
    this.bIconSize,
    this.rowCap,
    required this.bRadious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Bheight,
      width: bWidth,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(13, 216, 227, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(bRadious))
              ),
          onPressed: onPressed,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Btext,
                style: TextStyle(fontSize: btextFontSize),
              ),
              if (BIcon != null)
              SizedBox(
                width: rowCap ?? 0,
              ),
            if (BIcon != null)
              Icon(
                BIcon,
                size: bIconSize,
              ),
            ],
          )),
    );
  }
}
