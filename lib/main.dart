import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'middleware/ensure_auth_middleware.dart';
import 'middleware/ensure_not_authed_middleware.dart';
import 'screen/dashboard_screen.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/profile_screen.dart';
import 'screen/root_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      binds: [
        Bind.put(AuthService()),
      ],
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/',
          page: () => const RootScreen(),
          participatesInRootNavigator: true,
          preventDuplicates: true,
          children: [
            GetPage(
              middlewares: [
                //only enter this route when not authed
                EnsureNotAuthedMiddleware(),
              ],
              name: '/login',
              page: () => const LoginScreen(),
            ),
            GetPage(
              preventDuplicates: true,
              name: '/home',
              page: () => const HomeScreen(),
              title: null,
              children: [
                GetPage(
                  name: '/dashboard',
                  page: () => const DashboardScreen(),
                ),
                GetPage(
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                  name: '/profile',
                  page: () => const ProfileScreen(),
                  title: 'Profile',
                  transition: Transition.size,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
