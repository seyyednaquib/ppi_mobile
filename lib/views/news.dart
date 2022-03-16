import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:utm_connect/controller/product_controller.dart';
import 'package:utm_connect/views/news_details.dart';
import 'package:utm_connect/views/news_tiles.dart';
import 'package:utm_connect/views/open_news.dart';

class NewsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  bool toggleview = false;
  goToNext(int index) {
    Get.to(() => ProductDetailsView(
          product: productController.productList[index],
        ));
    // Get.to(() => OpenNews(
    //       product: productController.productList[index],
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          leading: Container(
            padding: EdgeInsets.all(8),
            child: Image.asset('assets/images/logo.png'),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                toggleview == true;
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 1,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => goToNext(index),
                        child:
                            ProductTile(productController.productList[index]));
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
