import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDDropDown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final Function(T) onSelected;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const SDDropDown({
    super.key,
    required this.items,
    this.selectedItem,
    required this.onSelected,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => _buildMaterialDropdown(context),
      cupertino: (_, __) => _buildCupertinoDropdown(context),
    );
  }

  Widget _buildMaterialDropdown(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedItem,
      decoration: InputDecoration(
        fillColor: backgroundColor ?? context.theme.colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.colorScheme.outline,
          ),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: SDText(item.toString(), style: textStyle),
              ))
          .toList(),
      onChanged: (value) => onSelected(value as T),
    );
  }

  Widget _buildCupertinoDropdown(BuildContext context) {
    return CupertinoPicker(
      backgroundColor: backgroundColor ?? context.theme.colorScheme.surface,
      onSelectedItemChanged: (index) {
        onSelected(items[index]);
      },
      itemExtent: 32,
      children: items.map((item) => SDText(item.toString(), style: textStyle)).toList(),
    );
  }
}
