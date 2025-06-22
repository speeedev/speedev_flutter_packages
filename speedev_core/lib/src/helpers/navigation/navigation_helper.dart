import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SDNavHelper {
  late RootStackRouter router;

  void init({
    required RootStackRouter router,
  }) {
    this.router = router;
  }

  static SDNavHelper? _instance;
  factory SDNavHelper() => _instance ??= SDNavHelper._();

  SDNavHelper._();

  Future<void> navigate(BuildContext context, {required PageRouteInfo route, Map<String, dynamic>? params}) async {
    await router.push(route.copyWith(params: params));
  }

  Future<void> pop(BuildContext context) async {
    await router.maybePop();
  }

  void popUntil(BuildContext context, {required RoutePredicate predicate}) {
    router.popUntil(predicate);
  }

  void popUntilRoot(BuildContext context) async {
    router.popUntilRoot();
  }

  Future<void> replace(BuildContext context, {required PageRouteInfo route}) async {
    await router.replace(route);
  }

  Future<void> replaceAll(BuildContext context, {required List<PageRouteInfo> pages}) async {
    await router.replaceAll(pages);
  }
}
