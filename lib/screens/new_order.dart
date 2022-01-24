import 'dart:ui';

import 'package:fc/components/categories.dart';
import 'package:fc/constants.dart';
import 'package:fc/models/product.dart';
import 'package:fc/screens/login.dart';
import 'package:flutter/material.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final shops = ['SELECT SHOP', 'OK', 'PnP', 'FOOD LOVERS', 'SPAR'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: cTextColor,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: cTextColor,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              'New Order',
              style: TextStyle(color: cTextColor),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: cDefaultPadding / 2),
            child: Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Categories(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: cDefaultPadding / 2),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: cDefaultPadding / 2,
                  crossAxisSpacing: cDefaultPadding / 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String shop) => DropdownMenuItem(
        value: shop,
        child: Text(shop),
      );
}

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function? press;

  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(cDefaultPadding / 2),
        // height: 180,
        // width: 160,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(cDefaultRadius)),
        child: Image.asset(product!.image),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: cDefaultPadding / 8),
        child: Text(
          product!.name,
          style: const TextStyle(color: cTextLightColor),
        ),
      ),
      Text(
        '\$' + product!.price,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
      // orderItems()
    ]);
  }
}
