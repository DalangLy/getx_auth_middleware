import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          width: double.infinity,
          height: 25,
          alignment: Alignment.center,
          child: const Text("Home View"),
        ),
        Expanded(
          child: GetRouterOutlet.builder(
            route: '/home',
            builder: (context) {
              return Scaffold(
                body: GetRouterOutlet(
                  initialRoute: '/home/dashboard',
                  anchorRoute: '/home',
                ),
                bottomNavigationBar: IndexedRouteBuilder(
                  routes: const [
                    '/home/dashboard',
                    '/home/profile',
                  ],
                  builder: (context, routes, index) {
                    final delegate = context.delegate;
                    return BottomNavigationBar(
                      currentIndex: index,
                      onTap: (value) => delegate.toNamed(routes[value]),
                      items: const [
                        // _Paths.HOME + [Empty]
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Dashboard',
                        ),
                        // _Paths.HOME + Routes.PROFILE
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_box_rounded),
                          label: 'Profile',
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
