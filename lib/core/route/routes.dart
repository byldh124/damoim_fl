import 'package:damoim/features/common/screens/splash/splash_screen.dart';
import 'package:damoim/features/user/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen())
  ],
);
