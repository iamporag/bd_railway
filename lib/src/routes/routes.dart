// ignore_for_file: constant_identifier_names

class Routes {
  static const SPLASH_SCREEN_ROUTE = Route(path: '/', name: 'splash_screen');
  static const ONBOARDING_SCREEN_ROUTE = Route(path: '/onboarding', name: 'onboarding_screen');
  static const LOGIN_SCREEN_ROUTE = Route(path: '/signin', name: 'signin');
  static const REGISTER_SCREEN_ROUTE = Route(path: '/register', name: 'register');
  static const HOME_SCREEN_ROUTE = Route(path: '/home', name: 'home');

}

class Route {
  final String path;
  final String name;
  const Route({required this.path, required this.name});
}
