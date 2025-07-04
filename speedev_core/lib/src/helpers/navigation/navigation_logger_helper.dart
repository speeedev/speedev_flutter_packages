import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:speedev_core/speedev_core.dart';

class SDNavLoggerHelper extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    SDLoggerHelper().info('New route pushed: ${route.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    SDLoggerHelper().info('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    SDLoggerHelper().info('Tab route re-visited: ${route.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    SDLoggerHelper().info('Route popped: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    SDLoggerHelper().info('Route removed: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    SDLoggerHelper().info('Route replaced: ${newRoute?.settings.name}');
  }
}
