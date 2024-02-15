part of '../routes.dart';

// ホームタブの定義
class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

// ホームタプの状態
const homeStatefulShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<Sample1PageRoute>(
          path: 'sample1',
        ),
        TypedGoRoute<Sample2PageRoute>(
          path: 'sample2',
        ),
      ],
    ),
  ],
);

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class Sample1PageRoute extends GoRouteData {
  const Sample1PageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Sample1Page();
  }
}

class Sample2PageRoute extends GoRouteData {
  const Sample2PageRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Sample2Page();
  }
}
