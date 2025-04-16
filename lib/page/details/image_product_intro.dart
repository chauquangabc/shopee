import 'package:flutter/material.dart';

import '../../models/products.dart';

class ImageProductIntro extends StatefulWidget {
  final Product products;

  const ImageProductIntro({required this.products, super.key});

  @override
  State<ImageProductIntro> createState() => _ImageProductIntroState();
}

class _ImageProductIntroState extends State<ImageProductIntro> {
  int selectItem = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectItem);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            itemCount: widget.products.images.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectItem = index;
              });
            },
            itemBuilder:
                (context, index) => Image.network(
                  widget.products.images[index],
                  fit: BoxFit.contain,
                ),
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.products.images.length,
              (index) => productMini(index),
            ),
          ),
        ),
      ],
    );
  }

  Widget productMini(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectItem = index;
        });
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          border: Border.all(
            color: selectItem == index ? Colors.red : Colors.grey,
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(right: 15),
        child: Image.network(widget.products.images[index], fit: BoxFit.contain),
      ),
    );
  }
}
