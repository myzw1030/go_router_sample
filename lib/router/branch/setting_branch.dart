part of '../routes.dart';

// ホームタブの定義
class SettingShellBranch extends StatefulShellBranchData {
  const SettingShellBranch();
}

// ホームタプの状態
const settingStatefulShellBranch = TypedStatefulShellBranch<SettingShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingPageRoute>(
      path: '/setting',
    ),
  ],
);

class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingPage();
  }
}
