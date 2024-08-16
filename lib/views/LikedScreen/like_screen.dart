import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../utlis/colors.dart';
import '../../utlis/constants/widgets/button_widget.dart';
import '../homeScreen/widget/custom_appBar_widget.dart';
import 'widget/favLiked_list.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return SafeArea(
        child: Scaffold(
            backgroundColor: CosColors().backgroundColor,
            body: StreamBuilder<List<Map<String, dynamic>>>(
              stream: controller.getLikedItemsStream(),
              builder: (context, snapshot) {
                var likedItems = snapshot.data ?? [];
                var itemCount = likedItems.length;

                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customAppbar(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text(
                        "favorites",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: CosColors().mainTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text(
                        "$itemCount Product${itemCount == 1 ? '' : 's'}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CosColors().thirdTextColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Container(
                        height: 598,
                        width: double.infinity,
                        color: CosColors().backgroundColor,

                        //List View Seperated
                        child: snapshot.connectionState ==
                                ConnectionState.waiting
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : itemCount == 0
                                ? Center(
                                    child: Text('No liked Product Avaliable'),
                                  )
                                : ListView.separated(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: itemCount,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data = likedItems[index];
                                      bool isLiked = data['isLiked'] ?? false;
                                      String docId = data['docId'] ?? '';
                                      String name = data['collectionName'] ??'';
                                      return Container(
                                        height: 260,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                231, 249, 254, 1),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                    height: 210,
                                                    width: 150,
                                                    child: Image.network(
                                                      data['imageUrl'] ??
                                                          'Unknown Image',
                                                      height: 100,
                                                    )),
                                                SizedBox(
                                                  height: 210,
                                                  width: 189,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Container(
                                                                height: 55,
                                                                width: 130,
                                                                child: Text(
                                                                  data['name'] ??
                                                                      'Unknown name',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                             controller.toggleLike(name,docId, isLiked);
                                                            },
                                                            icon: Icon(
                                                              isLiked
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color: isLiked
                                                                  ? Colors.red
                                                                  : Colors.grey,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      FavLikedListText(
                                                        text:
                                                            "Color: ${data['color']}",
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      FavLikedListText(
                                                        text: '"Size: 11"',
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      FavLikedListText(
                                                        text: '"Qty: 1"',
                                                      ),
                                                      const SizedBox(
                                                        height: 14,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              data['price'] ??
                                                                  'Unknown price',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            ButtonWidget(
                                              Btext: "ADD TO CART",
                                              Bheight: 45,
                                              bWidth: 339,
                                              bRadious: 10,
                                              btextFontSize: 20,
                                              onPressed: () {
                                                controller.addToCart(data);
                                                Get.snackbar('Cart',
                                                    'Item added to cart.');
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(
                                      color: CosColors().backgroundColor,
                                    ),
                                  ),
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
