import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/products.dart';
import '../../page_unloggin/details/details_product.dart';

class HomeScreenLogged extends StatefulWidget {
  const HomeScreenLogged({super.key});

  @override
  State<HomeScreenLogged> createState() => _HomeScreenLoggedState();
}

class _HomeScreenLoggedState extends State<HomeScreenLogged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(214, 217, 217, 1),
      appBar: CustomAppbar(),
      body: ListView(
        children: [
          Component1(),
          Component2(),
          Component3()
        ],
      ),
    );
  }
}


class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        color: Color.fromRGBO(237, 78, 46, 1),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 10),
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
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
                  ),
                  IconButton(
                      onPressed: () {
                        print('Find Product');
                      },
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass))
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('Click cartShopping');
                        },
                        icon: FaIcon(
                          size: 30,
                          FontAwesomeIcons.cartShopping, color: Colors.white,)),
                    IconButton(onPressed: () {},
                        icon: FaIcon(
                          size: 30,
                          FontAwesomeIcons.solidMessage, color: Colors.white,))
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

class Component1 extends StatefulWidget {
  const Component1({super.key});

  @override
  State<Component1> createState() => _Component1State();
}

class _Component1State extends State<Component1> {
  List<Map<String, dynamic>> items(BuildContext context) {
    return [
      {
        "text": "Shopee siêu rẻ",
        "image": "assets/sp_cheapest.png",
        "onPressed": () {
          print("Clicked: Shopee siêu rẻ");
        },
      },
      {
        "text": "Mã giảm giá",
        "image": "assets/img_discount.png",
        "onPressed": () {
          print("Clicked: Mã giảm giá");
        },
      },
      {
        "text": "Miễn phí Ship",
        "image": "assets/img_freeDelivery.png",
        "onPressed": () {
        },
      },
      {
        "text": "Shopee Mall",
        "image": "assets/img_handbags.png",
        "onPressed": () {
          print("Clicked: Shopee Mall");
        },
      },
      {
        "text": "Xem thêm",
        "image": "assets/img_bonus.png",
        "onPressed": () {
          print("Clicked: Xem thêm");
        },
      },
    ];
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: RawScrollbar(
        controller: _scrollController,
        // Gán controller cho Scrollbar
        thumbVisibility: true,
        // Hiện thanh cuộn
        thickness: 5,
        // Độ dày thanh cuộn (bé lại)
        radius: Radius.circular(10),
        // Bo tròn góc
        thumbColor: Colors.orange,
        // Màu của thanh cuộn
        mainAxisMargin: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: List.generate(
              5,
                  (index) => Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    padding:
                    EdgeInsets.zero, // Đảm bảo không có khoảng padding thừa
                  ),
                  onPressed: items(context)[index]['onPressed'],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Căn giữa theo chiều dọc
                    children: [
                      Expanded(
                        // Giúp ảnh co giãn nhưng không vượt quá khung
                        child: Image.asset(
                          items(context)[index]['image'],
                          fit: BoxFit.contain, // Đảm bảo ảnh vừa khung
                        ),
                      ),
                      SizedBox(height: 5),
                      // Tạo khoảng cách giữa ảnh và chữ
                      Text(
                        items(context)[index]['text'],
                        style: TextStyle(fontSize: 11, color: Colors.black),
                        // Giảm size chữ nếu cần
                        textAlign: TextAlign.center,
                        // Căn giữa chữ
                        maxLines: 2,
                        // Giới hạn số dòng chữ
                        overflow:
                        TextOverflow
                            .ellipsis, // Nếu dài quá thì sẽ có dấu "..."
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Component2 extends StatefulWidget {
  const Component2({super.key});

  @override
  State<Component2> createState() => _Component2State();
}

class _Component2State extends State<Component2> {

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> images = [
    "https://cf.shopee.vn/file/vn-11134258-7ras8-m5184szf0klz56_xxhdpi",
    "https://cf.shopee.vn/file/vn-11134258-7ra0g-m7fzbm4gsgl8bf_xxhdpi",
    "https://cf.shopee.vn/file/vn-11134258-7ra0g-m7g6unzjc994bc_xxhdpi",
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _nextImage() {
    setState(() {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _previousImage() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      } else {
        _currentPage = images.length - 1;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),
        ),

        // Nút Previous
        Positioned(
          left: 5,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: _previousImage,
          ),
        ),

        // Nút Next
        Positioned(
          right: 5,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: _nextImage,
          ),
        ),

        Positioned(
          bottom: 5,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: images.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.orange, // Màu dot khi đang hiển thị
              dotColor: Colors.grey, // Màu dot khi chưa active
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
            ),
          ),
        ),
      ],
    );
  }
}

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
          itemCount: products.length ,
          itemBuilder: (context, index) {
            try{
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
                child:
                Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      height: 230,
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 140,
                            width: double.infinity,
                            child: Image.network(
                              product.images[0],
                              fit: BoxFit.contain,
                            ),
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
                              Text('Đã bán ${product.saleQuantity}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          '-${product.discount.toInt()}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } catch(e){
              print("Lỗi khi render product ở index $index: $e");
            }
          },
        );
      },
    );
  }
}