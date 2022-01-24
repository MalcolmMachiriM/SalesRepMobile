import 'dart:ui';
import 'package:fc/constants.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final shops = ['OK', 'PnP', 'Food Lovers', 'Spar'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: cButtonColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.arrow_back),
      //     color: cTextColor,
      //   ),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.shopping_cart_outlined),
      //       color: cTextColor,
      //     ),
      //   ],
      // ),
      backgroundColor: Colors.green[350],
      body: Column(
        children: [
          Column(
            children: [
              const Text(''),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcome!!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                width: 1 / 3 * MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: shops.map(buildMenuItem).toList(),
                    hint: const Center(
                      child: Text('Select Shop'),
                    ),
                    value: value,
                    alignment: Alignment.center,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55 / 100 * MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(80)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashCard(
                        'New Order',
                        Icons.add_circle_outline,
                      ),
                      dashCard(
                        'Recents',
                        Icons.history,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashCard(
                        'Cart',
                        Icons.shopping_cart_outlined,
                      ),
                      dashCard('Logistics', Icons.local_shipping_outlined),
                    ],
                  ),
                  // Center(
                  //     child: Container(
                  //   width: 2 / 3 * MediaQuery.of(context).size.width,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  //   child: ElevatedButton(
                  //     // style: ButtonStyle(elevation: elevation),
                  //     child: const Text('Create New Order'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, RoutingConstants.home);
                  //     },
                  //   ),
                  // ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String shop) =>
      DropdownMenuItem(child: Text(shop), value: shop);

  dashCard(String text, IconData icon) {
    return SizedBox(
      width: 0.45 * MediaQuery.of(context).size.width,
      height: 0.4 * MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, size: 45),
            Text(text),
          ],
        ),
      ),
    );
  }

  buildSideBar(IconData icon, String text, dynamic screen) {
    return Transform.scale(
      scale: 1.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  // currentScreen = screen;
                });
              },
              child: Row(
                children: [
                  const VerticalDivider(
                    color: Colors.transparent,
                  ),
                  Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  const VerticalDivider(color: Colors.transparent),
                  Text(
                    text,
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
