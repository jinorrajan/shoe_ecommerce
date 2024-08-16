// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/controller.dart';
import 'package:get/get.dart';
import '../widget/Gridview_Tile_widget.dart';

class NikeScreen extends StatelessWidget {
  NikeScreen({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: controller.getNikeItemsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        }

         var items = snapshot.data!;

        return GridView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
           itemCount: items.length,
            itemBuilder: (context, index) {
              var data = items[index];
              bool isLiked = data['isLiked'] ?? false;
              String docId = data['docId'] ?? '';
            return TileWidget(
              iconButton: IconButton(
                onPressed: () => controller.toggleLike('Nike',docId, isLiked,),
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
              ),
              singleProductBrand: data['brand'] ?? '',
              singlePagePrice: data['price'] ?? 0,
              productName: data['name'] ?? '',
              singleproduct: data['imageUrl'] ?? '',
              price: data['price'] ?? 0,
              imagepath: data['imageUrl'] ?? '',
              description: data['name'] ?? '',
              descriptions: data['description'] ?? '',
            );
          },
        );
      },
    );
  }
}
