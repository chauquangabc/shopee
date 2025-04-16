import 'package:flutter/material.dart';
import 'package:shopee/page/main_page.dart';

class ShoppingcartScreen extends StatefulWidget {
  const ShoppingcartScreen({super.key});

  @override
  State<ShoppingcartScreen> createState() => _ShoppingcartScreenState();
}

class _ShoppingcartScreenState extends State<ShoppingcartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Giỏ hàng',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.red,
          size: 30, // Màu của nút back
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(214, 217, 217, 1),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                'https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/cart/ef577a25315c384ed114.png',
              ),
            ),
            Text(''' 'Hổng' có gì trong giỏ hết  ''',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text('Lướt Shopee , lựa hàng ngay đi !',style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.red
                  )
                ),
                child:Text('Mua sắm ngay',style: TextStyle(fontSize: 20,color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
