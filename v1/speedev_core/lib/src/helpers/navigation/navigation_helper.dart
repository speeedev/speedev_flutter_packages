import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SDNavHelper {
  Future<void> navigate(BuildContext context, {required PageRouteInfo route, Map<String, dynamic>? params}) async {
    await context.router.push(route.copyWith(params: params));
  }

  Future<void> pop(BuildContext context) async {
    await context.router.maybePop();
  }

  void popUntil(BuildContext context, {required RoutePredicate predicate}) {
    context.router.popUntil(predicate);
  }

  void popUntilRoot(BuildContext context) async {
    context.router.popUntilRoot();
  }

  Future<void> replace(BuildContext context, {required PageRouteInfo route}) async {
    await context.router.replace(route);
  }

  Future<void> replaceAll(BuildContext context, {required List<PageRouteInfo> pages}) async {
    await context.router.replaceAll(pages);
  }
}