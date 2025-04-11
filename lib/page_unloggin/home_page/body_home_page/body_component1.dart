import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../profile_page/login.dart';

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
