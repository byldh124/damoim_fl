import 'package:damoim/presentation/common/screens/splash_screen.dart';
import 'package:damoim/presentation/home/screens/home_root.dart';
import 'package:damoim/presentation/user/screens/login_screen.dart';
import 'package:damoim/presentation/user/screens/signup_screen.dart';
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
