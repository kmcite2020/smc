import 'package:smc/dashboard/ui/dashboard_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final router = RM.injectNavigator(
  routes: {
    '/': (RouteData data) => const DashboardPage(),
  },
);
