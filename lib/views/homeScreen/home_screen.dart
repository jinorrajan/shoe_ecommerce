import 'package:flutter/material.dart';
import 'package:flutter_application_2/utlis/colors.dart';
import 'package:get/get.dart';

import '../../controller/search_contoller.dart';
import '../cartScreen/product_view_screen.dart';
import 'tabar_screens/adidas_screen.dart';
import 'tabar_screens/crocs_screen.dart';
import 'tabar_screens/nike_screen.dart';
import 'widget/custom_appBar_widget.dart';
import 'widget/searchBar_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SearchhController searchController = Get.put(SearchhController());
    TabController tabcontroller = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Scaffold(
        backgroundColor: CosColors().backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                customAppbar(),
                const SizedBox(height: 30),
                searchBar(
                  onchanged: (value) {
                    searchController.searchText.value = value;
                    searchController.fetchShoes(value);
                  },
                ),
                Obx(() {
                  // Show the auto-suggestion list only if there are search results
                  if (searchController.searchResults.isNotEmpty) {
                    return Container(
                      height: 300, // Adjust the height based on your needs
                      child: ListView.builder(
                        itemCount: searchController.searchResults.length,
                        itemBuilder: (context, index) {
                          var item = searchController.searchResults[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8,),
                            child: ListTile(
                              tileColor: Color.fromARGB(255, 224, 242, 255),
                              title: Text(item['name']),
                              subtitle: Text(item['collection']),
                              onTap: () {
                                searchController.clearSearch();
                                // Navigate to the specific shoe screen
                                Get.to(() => ProductViewScreen(
                                  singleProductView: item['imageUrl'],
                                  productName: item['name'],
                                  description: item['description'],
                                  singlepageprice: item['price'].toString(),
                                  singleProductBrand: item['brand'],
                                ));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                  // Return the normal home page content when not searching
                  return Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 28),
                              child: Text(
                                "Categories",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: CosColors().mainTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TabBar(
                          controller: tabcontroller,
                          indicatorColor: CosColors().ButtonColor,
                          dividerColor: CosColors().backgroundColor,
                          tabs: const [
                            Tab(text: "Nike"),
                            Tab(text: "Adidas"),
                            Tab(text: "Cross"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabcontroller,
                            children: [
                              NikeScreen(),
                              AdidasScreen(),
                              CrocsScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
