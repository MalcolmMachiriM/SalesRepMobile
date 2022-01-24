import 'package:fc/components/text_field.dart';
import 'package:fc/screens/cart.dart';
import 'package:fc/screens/dashboard.dart';
import 'package:fc/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav_bar.dart';
import 'routing_constants.dart';
import 'screens/new_order.dart';
import 'screens/login.dart';
import 'screens/recent_orders.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutingConstants.login:
        return navigateToPage(const Login());
      case RoutingConstants.newOrder:
        return navigateToPage(const NewOrder());
      case RoutingConstants.dashboard:
        return navigateToPage(const Dashboard());
      case RoutingConstants.recents:
        return navigateToPage(const RecentOrders());
      case RoutingConstants.cart:
        return navigateToPage(const Cart());
      case RoutingConstants.bottomNav:
        return navigateToPage(const BottomNav());
      case RoutingConstants.details:
        return navigateToPage(const DetailsScreen());

      // return navigateToPage(const BuildTextField());
      default:
        return navigateToPage(const Login());
    }
  }

  static MaterialPageRoute<dynamic> navigateToPage(dynamic page) =>
      MaterialPageRoute(builder: (_) => page);
}
