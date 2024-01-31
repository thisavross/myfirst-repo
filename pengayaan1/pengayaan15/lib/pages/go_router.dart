part of 'routers_go.dart';

var router_go = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const DetailScreen();
            }),
        GoRoute(
            path: 'navbar',
            builder: (BuildContext context, GoRouterState state) {
              return NavBarPage(); // krn stateful jadi gabisa pake constS
            }),
      ],
    ),
  ],
);
