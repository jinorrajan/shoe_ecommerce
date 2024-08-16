import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchhController extends GetxController {
  var searchResults = <Map<String, dynamic>>[].obs;
  var searchText = ''.obs;
  

  // Fetching all shoes from different collections
  void fetchShoes(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    // List of collections to search
    List<String> collections = ['Nike', 'adidas', 'Puma'];

    // Fetch from each collection
    for (String collection in collections) {
      var result = await FirebaseFirestore.instance
          .collection(collection)
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get();

      // Adding results to searchResults
      searchResults.addAll(result.docs.map((doc) {
        var data = doc.data();
        data['collection'] = collection;
        data['docId'] = doc.id;
        return data;
      }).toList());
    }
  }

  void clearSearch() {
    searchText.value = '';
    searchResults.clear();
  }
}
