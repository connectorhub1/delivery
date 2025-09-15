import 'package:flutter/material.dart';
import '../../models/app_user.dart';

class RiderHome extends StatelessWidget {
  final AppUser user;

  RiderHome({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rider Home')),
      body: Center(child: Text('Hello, ${user.name}! (Rider role)')),
      // TODO: Implement order pickup/delivery, live location, route
    );
  }
}