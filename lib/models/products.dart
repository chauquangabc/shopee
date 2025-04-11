class Product {
  final String title, description;
  final String id;
  final List<String> images;
  final int price, saleQuantity;
  final double rating, discount;
  final List<dynamic> feedback;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.discount,
    this.rating = 0,
    this.saleQuantity = 0,
    this.feedback =  const [],
  });

  factory Product.fromFirestore(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      price: json['price'] ?? 0,
      discount: (json['discount'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      saleQuantity: json['saleQuantity'] ?? 0,
      feedback: List<dynamic>.from(json['feedback'] ?? []),
    );
  }
}

final List<Product> demoProducts = [
  Product(
    id: '1',
    title: 'Áo dsquare2',
    description: 'Đẹp vl ',
    images: ['assets/dsq2.webp', 'assets/dsq2_1.webp', 'assets/dsq2_3.webp'],
    price: 150000,
    discount: 15,
    saleQuantity: 5,
  ),
  Product(
    id: '2',
    title: 'Bộ quần áo mùa hè siêu thoáng mát siêu đẹp siêu rẻ siêu xịn ! ',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes1.webp'],
    saleQuantity: 50,
    discount: 20,
    price: 200000,
  ),
  Product(
    id: '3',
    title: 'Bộ quần áo mùa hè ',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes2.jpg'],
    saleQuantity: 40,
    discount: 30,
    price: 500000,
  ),
  Product(
    id: '4',
    title: 'Bộ quần áo mùa hè 2',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes3.jpg'],
    saleQuantity: 60,
    discount: 50,
    price: 60000,
  ),
  Product(
    id: '5',
    title: 'Bộ quần áo mùa hè 3',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes4.jpg'],
    saleQuantity: 10,
    price: 80000,
    discount: 50,
  ),
  Product(
    id: '6',
    title: 'Bộ quần áo mùa hè 4',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes5.jpg'],
    discount: 25,
    saleQuantity: 35,
    price: 90000,
  ),
  Product(
    id: '7',
    title: 'Bộ quần áo mùa hè 5',
    description: 'Giá rẻ bất ngờ',
    images: ['assets/img_clothes4.jpg'],
    saleQuantity: 15,
    price: 90000,
    discount: 50,
  ),
];
