import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SDBottomNavBarItem extends BottomNavigationBarItem {
  const SDBottomNavBarItem({
    super.key,
    required super.icon,
    super.label,
    super.activeIcon,
    super.backgroundColor,
    super.tooltip,
  });
}

class SDBottomNavBar extends PlatformNavBar {
  @override
  final List<SDBottomNavBarItem> items;
  @override
  final int currentIndex;
  final Function(int)? onTap;
  @override
  final Color? backgroundColor;

  SDBottomNavBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.backgroundColor,
  }) : super(
          currentIndex: currentIndex,
          items: items,
          itemChanged: onTap,
          backgroundColor: backgroundColor,
        );
}
