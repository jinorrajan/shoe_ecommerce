// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:flutter_application_2/utlis/colors.dart';
import 'package:flutter_application_2/utlis/constants/widgets/button_widget.dart';

class ProductViewScreen extends StatefulWidget {
  String? singleProductView;
  String description;

  String productName;
  
  String? singlepageprice;
  
  String? singleProductBrand;
  ProductViewScreen({
    Key? key,
    this.singleProductView,
    this.singleProductBrand,
    required this.description,
    required this.productName,
   this.singlepageprice,

  }) : super(key: key);

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CosColors().backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ProductCustomAppBar
              const ProductViewCustomAppBar(),
          
              const SizedBox(
                height: 10,
              ),
          
               Padding(
                padding: EdgeInsets.only(left: 32),
                // brand Name
                child: Text(
                  widget.singleProductBrand.toString(),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              // Shoe Name
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  widget.productName.toString(),
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: CosColors().mainTextColor),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 36),
                child: Text(
                  "Men's Basketball Shoe",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 10),
                child: Container(
                  height: 208,
                  width: 357,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "1 / 7",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                                size: 30,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_circle_left_outlined,
                                    size: 33,
                                    color: Color.fromRGBO(13, 216, 227, 1),
                                  )),
                              Container(
                                height: 157,
                                width: 250,
                                child: Image.network(
                                    widget.singleProductView.toString()),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 33,
                                    color: Color.fromRGBO(13, 216, 227, 1),
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          
              // Decription section and button
              Container(
                height: 440,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(213, 244, 245, 245),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(157, 210, 209, 209),
                        spreadRadius: 1,
                        blurRadius: 7,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(21),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      Text(
                        widget.description.toString(),
                        style: TextStyle(color: Colors.black38),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
          
                      // price Tag
          
                      RichText(
                          text:  TextSpan(
                              text: '>  ',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromRGBO(13, 216, 227, 1)),
                              children: [
                            TextSpan(
                                text: widget.singlepageprice.toString(),
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black)),
                            
                          ])),
          
                      Container(
                        height: 72,
                        width: 360,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(222, 243, 249, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            // price ,size,qty widget
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Text(
                                  "Color",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                                Text(
                                  "QTY",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black45),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "43",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.expand_more_sharp,
                                      color: Color.fromRGBO(13, 216, 227, 1),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    Icon(
                                      Icons.expand_more_sharp,
                                      color: Color.fromRGBO(13, 216, 227, 1),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.expand_more_sharp,
                                      color: Color.fromRGBO(13, 216, 227, 1),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
          
                      // const SizedBox(
                      //   height: 1,
                      // ),
          
                      // buttonWidget
                      ButtonWidget(
                        Btext: 'Add To Bag',
                        BIcon: Icons.shopping_bag_outlined,
                        Bheight: 60,
                        bWidth: 370,
                        btextFontSize: 20,
                        bIconSize: 30,
                        rowCap: 20,
                        bRadious: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// All reusable widget here

class ProductViewCustomAppBar extends StatelessWidget {
  const ProductViewCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, top: 9),
          child: IconButton(
              iconSize: 50,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                color: Color.fromRGBO(13, 216, 227, 1),
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
