import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:shopee/models/products.dart';

import '../../details/details_product.dart';

class Component3 extends StatefulWidget {
  const Component3({super.key});

  @override
  State<Component3> createState() => _Component3State();
}

class _Component3State extends State<Component3> {
  final formatCurrency = NumberFormat('#,##0', 'vi_VN');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('products').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Text("No data here");
        }
        final products =
            snapshot.data!.docs
                .map((doc) => Product.fromFirestore(doc))
                .toList();

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsProduct(products: product),
                  ),
                );
              },
              child: Container(
                height: 200,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      height: 150,
                      width: double.infinity,
                      child:
                      product.images.isNotEmpty
                          ? Image.network(
                            product.images[0],
                            fit: BoxFit.contain,
                          )
                          : Icon(Icons.image_not_supported),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'đ',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                              ),
                            ),
                            SizedBox(width: 1),
                            Text(
                              '${formatCurrency.format(product.price * (100 - product.discount) / 100)}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        Text(' Đã bán ${product.saleQuantity}'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
