
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class AcountOverListTile extends StatelessWidget {
  IconData iconsOverView;
  Color iconOverViewColor;
  VoidCallback? onPressed; 
  String text;
  AcountOverListTile({
    super.key,
    required this.iconsOverView,
    required this.iconOverViewColor,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 10),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                iconsOverView,
                color: iconOverViewColor,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 50,
                width: 210,
                child: Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                )),
            const SizedBox(
              width: 60,
            ),
            const Icon(Icons.arrow_forward_ios,size: 20),  
          ],
        ),
      ),
    );
  }
}
