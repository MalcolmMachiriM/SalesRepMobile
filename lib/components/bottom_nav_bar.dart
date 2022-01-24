import 'dart:ui';

import 'package:fc/constants.dart';
import 'package:fc/routing_constants.dart';
import 'package:fc/screens/cart.dart';
import 'package:fc/screens/dashboard.dart';
import 'package:fc/screens/details/details_screen.dart';
import 'package:fc/screens/new_order.dart';
import 'package:fc/screens/login.dart';
import 'package:fc/screens/recent_orders.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTab = 0;
  final List<Widget> screens = [
    const NewOrder(),
    const Cart(),
    const Login(),
    const Login()
  ];
  Widget currentScreen = const Dashboard();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: const Icon(
      //     Icons.add_circle_outline,
      //     size: 40,
      //     color: cButtonColor,
      //   ),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: (ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(cDefaultRadius),
            bottomRight: Radius.circular(cDefaultRadius)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x0FFE3F2F), Color(0x0FFBBDEF)])),
          child: Drawer(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image.asset('assets/images/strike_logo.png')),
                  Padding(
                    padding: const EdgeInsets.all(cDefaultPadding / 2),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildSideBar(Icons.add_circle_outline, 'New Order',
                              const NewOrder()),
                          buildSideBar(
                              Icons.history, 'Recents', const RecentOrders()),
                          buildSideBar(
                              Icons.home_outlined, 'Home', const Dashboard()),
                          buildSideBar(Icons.shopping_cart_outlined, 'cart',
                              const Cart()),
                          buildSideBar(
                              Icons.exit_to_app, 'Logout', const Login()),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        elevation: 50,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: FittedBox(
              child: Row(
                children: [
                  navigationButton(
                      'Home', Icons.home_outlined, const Dashboard(), 0),
                  navigationButton(
                      'Recents', Icons.history, const DetailsScreen(), 1),
                  navigationButton(
                      'Cart', Icons.shopping_cart_outlined, const Cart(), 2),
                  navigationButton('Logout', Icons.logout, const Login(), 3)
                ],
              ),
            )),
      ),
    );
  }

  MaterialButton navigationButton(
    String text,
    IconData icon,
    screen,
    int tab,
  ) {
    return MaterialButton(
        minWidth: 35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 30.0,
                color: currentTab == tab ? cButtonColor : cTextLightColor),
            Text(
              text,
              style: TextStyle(
                  color: currentTab == tab ? cButtonColor : cTextLightColor,
                  fontSize: 10),
            )
          ],
        ),
        onPressed: () {
          setState(() {
            currentScreen = screen;
            currentTab = tab;
          });
        });
  }

  buildSideBar(IconData icon, String text, dynamic screen) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentScreen = screen;
                Navigator.of(context).pop();
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
                  size: 45,
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
    );
  }
}
