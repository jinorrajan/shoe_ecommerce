// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../cartScreen/product_view_screen.dart';

// ignore: must_be_immutable
class TileWidget extends StatefulWidget {
  String price;
  String? singleproduct;
  // String PriceTag;

  String imagepath;

  String description;

  String descriptions;

  String? productName;

  String? singlePagePrice;
  IconButton? iconButton;
  
  String? singleProductBrand;
  TileWidget(
      {required this.price,
      required this.descriptions,
       this.iconButton,
      this.singleProductBrand,
      this.productName,
      this.singleproduct,
      required this.imagepath,
      required this.description,
      this.singlePagePrice,
      super.key});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  Color color = Colors.black87;
  IconData icons = Icons.favorite_border;
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(212, 249, 251, 252),
        borderRadius: BorderRadius.circular(20),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(157, 210, 209, 209),
            spreadRadius: 1,
            blurRadius: 7,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    // Text(widget.PriceTag),
                    Text(
                      widget.price,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(
                  right: 8,
                ),
                child:widget.iconButton,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductViewScreen(
                          singleProductBrand: widget.singleProductBrand.toString(),
                          singleProductView: widget.singleproduct.toString(),
                          description: widget.descriptions.toString(),
                          productName: widget.productName.toString(),
                          singlepageprice: widget.singlePagePrice.toString(),
                        )),
              );
            },
            child: SizedBox(
              height: 110,
              width: 140,
              child: Image.network(widget.imagepath),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 45,
              width: 140,
              child: Text(
                widget.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
