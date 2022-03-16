import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:utm_connect/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  static DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: product.isFavorite.value
                              ? Icon(Icons.favorite_rounded)
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            product.isFavorite.toggle();
                          },
                        ),
                      )),
                )
              ],
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
        ),
      ),
    );
  }
}
