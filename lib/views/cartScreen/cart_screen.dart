// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_application_2/utlis/colors.dart';

import '../homeScreen/widget/custom_appBar_widget.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  // Remove item from cart
  void removeFromCart(String docId) async {
    await FirebaseFirestore.instance.collection('Cart').doc(docId).delete();
    setState(() {});
  }

  // Stream to fetch items from Cart collection
  Stream<List<Map<String, dynamic>>> getCartItemsStream() {
    return FirebaseFirestore.instance
        .collection('Cart')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        var data = doc.data();
        data['docId'] = doc.id;
        return data;
      }).toList();
    });
  }
   double parsePrice(String priceString) {
    // Removing any non-numeric characters
    String numericString = priceString.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(numericString) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CosColors().backgroundColor,
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: getCartItemsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            var cartItems = snapshot.data ?? [];
            var itemCount = cartItems.length;
              // Calculate total price
            double totalPrice = 0.0;
            for (var item in cartItems) {
              totalPrice += parsePrice(item['price']);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppbar(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    "My Bag",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: CosColors().mainTextColor),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    "Check and Pay Your Shoes",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Container(
                      height: 420,
                      width: 370,
                      color: const Color.fromRGBO(222, 243, 249, 1),
                      child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            var data = cartItems[index];
                            return CartListTile(
                                image: data['imageUrl'],
                                certProductname: data['name'],
                                onPressed: () => removeFromCart(data['docId']), cartPrice: data['price'],);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                color: CosColors().backgroundColor,
                              ),
                          itemCount: cartItems.length)),
                ),
                const SizedBox(
                  height: 14,
                ),

                // Total Items Widget
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(231, 249, 254, 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(157, 200, 199, 199),
                            spreadRadius: 1,
                            blurRadius: 7,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            "$itemCount Items${itemCount == 1 ? '' : 's'}",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Text(
                            "💲$totalPrice",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 54, 0, 85)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 190,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(13, 216, 227, 1)),
                      onPressed: () {},
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

// class ScrolTileWidget extends StatelessWidget {
//   const ScrolTileWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 21),
//       child: Container(
//           height: 420,
//           width: 370,
//           color: const Color.fromRGBO(222, 243, 249, 1),
//           child: ListView.separated(
//               itemBuilder: (BuildContext context, int index) {
//                 return CartListTile(
//                   image: "assets/1.png", certProductname: '',
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) => Divider(
//                     color: CosColors().backgroundColor,
//                   ),
//               itemCount: 5)),
//     );
//   }
// }

// ignore: must_be_immutable
class CartListTile extends StatefulWidget {
  var image;
  String certProductname;
  VoidCallback onPressed;
  String cartPrice;
  CartListTile({
    Key? key,
    required this.image,
    required this.certProductname,
    required this.onPressed,
    required this.cartPrice,
  }) : super(key: key);

  @override
  State<CartListTile> createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) => widget.onPressed(),
              borderRadius: BorderRadius.circular(20),
              autoClose: false,
              spacing: 1,
              backgroundColor: const Color.fromARGB(87, 119, 225, 255),
              foregroundColor: const Color.fromARGB(255, 27, 0, 81),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: UseSwipeDeleteWidget(
          image: widget.image,
          certProductname: widget.certProductname.toString(), cartPrice: widget.cartPrice,
        ));
  }
}

// ignore: must_be_immutable
class UseSwipeDeleteWidget extends StatelessWidget {
  String image;

  String certProductname;
  
  String cartPrice;

  UseSwipeDeleteWidget({
    Key? key,
    required this.image,
    required this.certProductname,
    required this.cartPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Container(
        height: 112,
        width: 368,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(212, 249, 251, 252),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(157, 210, 209, 209),
                spreadRadius: 1,
                blurRadius: 7,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                certProductname,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(right: 45,left: 10),
                      child: Text(
                        cartPrice,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: RichText(
                          text: const TextSpan(
                              text: "-  ",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 17),
                              children: <TextSpan>[
                            TextSpan(
                                text: "1",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: "  +"),
                            TextSpan(
                                text: "  |  ",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "43",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "  ▼",
                                style: TextStyle(
                                    color: Color.fromARGB(221, 97, 97, 97),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ])),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 5),
                  child: InkWell(
                    child: Image.network(
                      image,
                      height: 68,
                      width: 140,
                      scale: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
