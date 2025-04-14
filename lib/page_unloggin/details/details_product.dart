import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shopee/page_unloggin/profile_page/login.dart';
import '../../models/products.dart';
import 'image_product_intro.dart';

class DetailsProduct extends StatefulWidget {
  final Product products;

  const DetailsProduct({required this.products, super.key});

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  final formatCurrency = NumberFormat('#,##0', 'vi_VN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  print('Find Product');
                },
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
              ),
            ],
          ),
        ),
        actions: [ButtonShoppingCart()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageProductIntro(products: widget.products),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'đ',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                decorationStyle: TextDecorationStyle.solid,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${formatCurrency.format(widget.products.price * (100 - widget.products.discount) / 100)}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'đ',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.combine([
                                  TextDecoration.lineThrough,
                                  TextDecoration.underline,
                                ]),
                                decorationColor: Colors.grey,
                              ),
                            ),
                            Text(
                              '${formatCurrency.format(widget.products.price)}',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text('Đã bán ${widget.products.saleQuantity}'),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      '${widget.products.title}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 10,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            ProductDescription(products: widget.products),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: Text('Sản phẩm liên quan'),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              child: Text('Đánh giá '),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 10),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                color: Color(0xFF3EB890),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print('Chat');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Icon(
                                Remix.wechat_2_line,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Chat ngay',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: Colors.black, height: 30, width: 1),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Add Shopping Cart");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Thêm giỏ hàng',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('Mua hàng ');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
                child: Container(
                  height: double.infinity,
                  color: Color(0xFFFE5621),
                  child: Center(
                    child: Text(
                      "Mua hàng ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonShoppingCart extends StatelessWidget {
  final int numberOfItems;

  const ButtonShoppingCart({this.numberOfItems = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('click shopping cart');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Login();
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Remix.shopping_cart_line,
              size: 26,
              color: Colors.white,
            ),
          ),
          if (numberOfItems != 0)
            Positioned(
              right: 15,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(child: Text('$numberOfItems')),
              ),
            ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final Product products;

  const ProductDescription({Key? key, required this.products})
    : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Mô tả sản phẩm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          AnimatedCrossFade(
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.products.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.products.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 2,
            width: double.infinity,
            color: Colors.grey[200],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Center(
              child: Text(
                isExpanded ? 'Thu gọn ▲' : 'Xem thêm ▼',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
