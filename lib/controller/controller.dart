import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class Controller extends GetxController{
  var nikeItems = <Map<String,dynamic>>[].obs;
  
  
  @override
  void onInit() {
    
    super.onInit();
getNikeItemsStream();
  }

// Function to fetch Nike items as a stream
  Stream<List<Map<String, dynamic>>> getNikeItemsStream() {
    return FirebaseFirestore.instance
      .collection('Nike')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          var data = doc.data();
          data['docId'] = doc.id;
          return data;
        }).toList();
      });
  }

  // Function to fetch Adidas items as a stream
  Stream<List<Map<String, dynamic>>> getAdidasItemsStream() {
    return FirebaseFirestore.instance
      .collection('adidas')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          var data = doc.data();
          data['docId'] = doc.id;
          return data;
        }).toList();
      });
  }

    Stream<List<Map<String, dynamic>>> getLikedItemsStream() {
    // List of collections to query
    List<String> collections = ['Nike', 'adidas'];

    // Create a list of streams for liked items from each collection
    List<Stream<List<Map<String, dynamic>>>> streams =
        collections.map((collection) {
      return FirebaseFirestore.instance
          .collection(collection)
          .where('isLiked', isEqualTo: true)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          var data = doc.data();
          data['docId'] = doc.id;
          data['collection'] = collection;
          return data;
        }).toList();
      });
    }).toList();

    // Combine the streams into one
    return CombineLatestStream.list(streams).map((listOfLists) {
      return listOfLists.expand((element) => element).toList();
    });
  }

 // Handle adding items to the cart

  // Add item to cart
  void addToCart(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(item['docId'])
        .set(item);
  }

    void toggleLike(String collectionName,String docId, bool currentStatus) async {
    await FirebaseFirestore.instance.collection(collectionName).doc(docId).update({
      'isLiked': !currentStatus,
    });
  }

}