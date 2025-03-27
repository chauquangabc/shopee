import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
