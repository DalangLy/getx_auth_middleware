import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_widget.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: RouterListener(builder: (context) {
          final title = context.location;
          return Text(title);
        }),
        centerTitle: true,
      ),
      //body: HomeView(),
      body: GetRouterOutlet(
        initialRoute: '/home',
        anchorRoute: '/',
      ),
    );
  }
}
