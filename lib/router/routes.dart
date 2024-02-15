// 参考: https://github.com/flutter/packages/blob/main/packages/go_router_builder/example/lib/stateful_shell_route_initial_location_example.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/home_page.dart';
import 'package:go_router_sample/pages/sample_1_page.dart';
import 'package:go_router_sample/pages/sample_2_page.dart';
import 'package:go_router_sample/pages/setting_page.dart';

part 'routes.g.dart';

part 'branch/home_branch.dart';

part 'branch/setting_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home', // 初期ルート
    navigatorKey: _rootNavigatorKey, // ルートナビゲーターキー
    debugLogDiagnostics: kDebugMode, // デバッグモードでのみログを出力
    routes: $appRoutes, // 生成されたルート
  );
});

// メインシェルルート定義
@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    homeStatefulShellBranch,
    settingStatefulShellBranch,
  ],
)

// メインシェルルートの状態
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppNavigationBar(navigationShell: navigationShell);
  }
}

// ナビゲーションバー
class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

  // タブ選択時の処理
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
