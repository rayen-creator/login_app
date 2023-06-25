import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<UserModel> getUserDate() => UserViewModel().getUser();
  String tokennn = "";
  @override
  void initState() {
    super.initState();

    getUserDate().then((value) {
      print("mytoken_" + value.token.toString());
      setState(() {
        tokennn = value.token.toString();
      });
      print("stockage" + tokennn.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dd"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [Text(tokennn)],
      )),
      // body: ChangeNotifierProvider<UserViewModel>(
      //     create: (BuildContext context) => userViewModel,
      //     child: Consumer<UserViewModel>(builder: (context, value, _) {
      //       return SafeArea(
      //           child: Column(
      //         children: [Text("Welcome HOME ! ${value.getUser().then((value) => value.token)}")],
      //       ));
      //     }))
    );
  }
}
