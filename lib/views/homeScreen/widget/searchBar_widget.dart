// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  ValueChanged<String> onchanged;

   searchBar({
    Key? key,
    required this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 368,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
                height: 55,
                width: 263,
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Find shoes",
                    hintStyle: const TextStyle(color: Colors.black45),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                onChanged: onchanged,),
                
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 216, 227, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 27,
              ),
            ),
          )
        ],
      ),
    );
  }
}
