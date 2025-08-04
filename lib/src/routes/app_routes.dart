import 'package:bd_railway/src/presentation/screens/auth/login_screen.dart';
import 'package:bd_railway/src/presentation/screens/auth/register_screen.dart';
import 'package:bd_railway/src/presentation/screens/home/home_screen.dart';
import 'package:bd_railway/src/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:bd_railway/src/presentation/screens/splash/splash_screen.dart';
import 'package:bd_railway/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: Routes.SPLASH_SCREEN_ROUTE.path,
      name: Routes.SPLASH_SCREEN_ROUTE.name,
      pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
    ),
    GoRoute(
      path: Routes.ONBOARDING_SCREEN_ROUTE.path,
      name: Routes.ONBOARDING_SCREEN_ROUTE.name,
      pageBuilder: (context, state) => MaterialPage(child: OnboardingScreen()),
    ),
    GoRoute(
      path: Routes.LOGIN_SCREEN_ROUTE.path,
      name: Routes.LOGIN_SCREEN_ROUTE.name,
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: Routes.REGISTER_SCREEN_ROUTE.path,
      name: Routes.REGISTER_SCREEN_ROUTE.name,
      pageBuilder: (context, state) => MaterialPage(child: RegisterScreen()),
    ),

    GoRoute(
      path: Routes.HOME_SCREEN_ROUTE.path,
      name: Routes.HOME_SCREEN_ROUTE.name,
      pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
    )
  ]);
}
