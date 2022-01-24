import 'package:fc/constants.dart';
import 'package:fc/models/product.dart';
import 'package:fc/screens/details/body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Product? product;
  const DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: products[0].color,
      appBar: AppBar(
        backgroundColor: products[0].color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: cTextColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: cTextColor,
          ),
          const SizedBox(width: cDefaultPadding / 4)
        ],
      ),
      body: Body(
        product: product,
      ),
    );
  }
}
