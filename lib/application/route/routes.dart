import 'package:damoim/features/common/screens/splash_screen.dart';
import 'package:damoim/features/home/screens/home_root.dart';
import 'package:damoim/features/user/screens/login_screen.dart';
import 'package:damoim/features/user/screens/signup_screen.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'signup',
          builder: (context, state) => const SignupScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeRoot(),
    ),
  ],
);
