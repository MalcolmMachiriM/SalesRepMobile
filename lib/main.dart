import 'package:fc/constants.dart';
import 'package:flutter/material.dart';

import 'routes.dart';
import 'routing_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formula Chemicals',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: cTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: RoutingConstants.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
