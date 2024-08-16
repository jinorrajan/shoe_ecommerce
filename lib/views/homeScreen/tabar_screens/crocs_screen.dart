import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/Gridview_Tile_widget.dart';

class CrocsScreen extends StatefulWidget {
  const CrocsScreen({super.key});

  @override
  State<CrocsScreen> createState() => _CrocsScreenState();
}

class _CrocsScreenState extends State<CrocsScreen> {
  // fetch the from firebase firestore
  Future<List<Map<String, dynamic>>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('adidas').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Color color = Colors.black87;
  IconData icons = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    // fetch the data and display 
    return FutureBuilder(
        future: fetchData(),
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
          return GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.78,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return TileWidget(
              
                price: data['price'],
                imagepath: data['imageUrl'],
                description: data['name'], descriptions: data['description'],
              );
            },
          );
        });
  }
}

