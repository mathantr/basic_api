import 'dart:core';

import 'package:flutter/material.dart';

import '/colors/color_fonts.dart';
import '/model/service/user_api.dart';
import '/model/user_model.dart';

class ApplePay extends StatefulWidget {
  const ApplePay({super.key});

  @override
  State<ApplePay> createState() => ApplePayState();
}

class ApplePayState extends State<ApplePay> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: liteWhite,
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.yellow : Colors.green;

          return Column(
            children: [
              ListTile(
                tileColor: color,
                leading: Image.network(user.image.thumbnail),
                title: Text(user.fullName),
                subtitle: Text(user.userlocation.coordinates.latitude),
                trailing: Text(
                  user.gender,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final user = await UserApi.fetchUsers();
    setState(() {
      users = user;
    });
  }
}
