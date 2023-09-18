import 'package:go_router/go_router.dart';
import 'package:non_trade_cement_bulk_order_only/router/routes_names.dart';
import 'package:non_trade_cement_bulk_order_only/screen/homepage/about.dart';
import 'package:non_trade_cement_bulk_order_only/screen/homepage/contsct.dart';
import 'package:non_trade_cement_bulk_order_only/screen/homepage/home_screen.dart';
import 'package:non_trade_cement_bulk_order_only/screen/homepage/services.dart';

bool isUserLogin =
//Prefs.getBool(PrefNames.isLogin) ??
    false;

// CustomTransitionPage buildPageWithDefaultTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
//   Offset? begin,
// }) {
//   return CustomTransitionPage<T>(
//     fullscreenDialog: true,
//     transitionDuration: const Duration(seconds: 1),
//     key: state.pageKey,
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//           alwaysIncludeSemantics: true, opacity: animation, child: child);

//       // SlideTransition(
//       //   position: Tween<Offset>(
//       //     begin: const Offset(0, 1.0),
//       //     end: Offset.fromDirection(0, 1.0),
//       //   ).animate(animation),
//       //   child: child,
//       // );
//     },
//   );
// }

String getInitialRoute() {
  switch (isUserLogin) {
    case false:
      return RouteNames.home;
    default:
      return RouteNames.home;
  }
}

final appRoute = GoRouter(initialLocation: getInitialRoute(), routes: [
  GoRoute(
      path: RouteNames.home,
      name: RouteNames.home,
      builder: (context, state) {
        return const HomeScreen();
      }),
  GoRoute(
      path: RouteNames.about,
      name: RouteNames.about,
      builder: (context, state) {
        return const About();
      }),
  GoRoute(
      path: RouteNames.services,
      name: RouteNames.services,
      builder: (context, state) {
        return const Services();
      }),
  GoRoute(
      path: RouteNames.contact,
      name: RouteNames.contact,
      builder: (context, state) {
        return const Contact();
      }),
]);
