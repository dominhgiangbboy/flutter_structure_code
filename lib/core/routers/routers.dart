import 'page_importer.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: homeRoute,
      builder: (context, state) {
        return const LandingPage();
      },
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) {
        return const LandingPage();
      },
    ),
    GoRoute(
      path: registerRoute,
      builder: (context, state) {
        return const LandingPage();
      },
    ),
  ],
);
