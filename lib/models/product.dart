import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  String code;
  String name;
  String category;
  String price;
  String volume;
  String weight;
  String vendor;
  final String image;
  Color? color;

  Product({
    this.code = '',
    this.name = '',
    this.category = '',
    this.price = '',
    this.volume = '',
    this.weight = '',
    this.vendor = '',
    this.image = '',
    this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['Product Code (article)'] as String,
      name: json['Product Name'] as String,
      category: json['Category'] as String,
      price: json['Product Price (USD)'] as String,
      volume: json['Product Volume'] as String,
      weight: json['Product Weight'] as String,
      vendor: json['Vendor'] as String,
      image: json['Image'] as String,
      color: json['Color'] as Color,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product Code (article)'] = code;
    data['Product Name'] = name;
    data['Category'] = category;
    data['Product Price (USD)'] = price;
    data['Product Volume'] = volume;
    data['Product Weight'] = weight;
    data['Vendor'] = vendor;
    data['Image'] = image;
    data['Color'] = color;
    return data;
  }
}

List<Product> products = [
  Product(
    code: ' CD01',
    name: 'Dishwashing Liquid',
    category: 'Catering and Kitchen Cleaners',
    price: '1',
    volume: '0.75',
    weight: '0.81',
    image: 'assets/images/dishwasher.jpg',
    color: Colors.blue,
  ),
  Product(
    code: ' CD02',
    name: 'Alcohol Based Hand Sanitiser',
    category: 'Disinfectant Care',
    price: '1.5',
    volume: '0.2',
    weight: '0.22',
    image: 'assets/images/sanitizer.jpg',
    color: Colors.amber,
  ),
  Product(
    code: ' CD03',
    name: 'Scouring Powder',
    category: 'Catering and Kitchen Cleaners',
    price: '4',
    volume: '5',
    weight: '5',
    image: 'assets/images/soap.jpg',
    color: Colors.red,
  ),
  Product(
    code: ' CD04',
    name: 'Antibacterial Liquid Hand Soap',
    category: 'Disinfectant Care',
    price: '32',
    volume: '25',
    weight: '26.2',
    image: 'assets/images/tile_cleaner.jpg',
    color: Colors.green,
  ),
  Product(
    code: ' CD05',
    name: 'Pine Gel',
    category: 'General Purpose Cleaners',
    price: '1.25',
    volume: '500',
    weight: '0.5',
    image: 'assets/images/pine_gel.jpg',
    color: Colors.purple,
  )
];
