import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:utm_connect/controller/product_controller.dart';
import 'package:utm_connect/models/product.dart';
import 'package:utm_connect/views/news.dart';
import 'package:utm_connect/views/news_tiles.dart';

class OpenNews extends StatelessWidget {
  final Product product;
  const OpenNews({Key key, this.product}) : super(key: key);
  static DateFormat formatter = DateFormat('dd/MM/yyyy');
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: Text(product.name),
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
                  Get.back();
                  //Get.off(NewsPage());
                },
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network(
                product.imageLink,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Category ' + product.productType,
                  maxLines: 3,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'Posted on ' + formatter.format(product.updatedAt),
                  maxLines: 3,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2),
            Text(
              product.description,
              maxLines: 3,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3),
          ],
        ));
  }
}

class required {}
