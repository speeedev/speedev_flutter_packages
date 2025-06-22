import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDDropDown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final Function(T) onSelected;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;


  const SDDropDown({
    super.key,
    required this.items,
    this.selectedItem,
    required this.onSelected,
    this.backgroundColor,
    this.textStyle,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSelectionSheet(context),
      child: Container(
        padding: SDPaddingValues.medium.paddingValue.toEdgeInsetsOnlyHorizontal,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.theme.colorScheme.surface,
          border: Border.all(
            color: context.theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(SDRadiusValues.small.radiusValue),
        ),
        child: Row(
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              8.width,
            ],
            Expanded(
              child: SDText(
                selectedItem?.toString() ?? hintText ?? 'Seçiniz',
                style: textStyle?.copyWith(
                      color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ) ??
                    context.theme.textTheme.bodyMedium?.copyWith(
                      color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
              ),
            ),
            suffixIcon ??
                Icon(
                  Icons.keyboard_arrow_down,
                  color: context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
          ],
        ),
      ),
    );
  }

  void _showSelectionSheet(BuildContext context) {
    if (Platform.isIOS) {
      _showCupertinoActionSheet(context);
    } else {
      _showMaterialBottomSheet(context);
    }
  }

  void _showMaterialBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildMaterialBottomSheet(context),
    );
  }

  void _showCupertinoActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => _buildCupertinoActionSheet(context),
    );
  }

  Widget _buildMaterialBottomSheet(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(SDRadiusValues.medium.radiusValue)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: SDPaddingValues.medium.paddingValue.toEdgeInsetsOnlyTop,
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.onSurface.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          16.height,
          Padding(
            padding: SDPaddingValues.medium.paddingValue.toEdgeInsetsOnlyHorizontal,
            child: Row(
              children: [
                SDText(
                  hintText ?? 'Seçiniz',
                  style: textStyle?.copyWith(
                        fontWeight: FontWeight.w500,
                      ) ??
                      context.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          16.height,
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = item == selectedItem;

                return ListTile(
                  title: SDText(
                    item.toString(),
                    style: textStyle?.copyWith(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? context.theme.colorScheme.primary : context.theme.colorScheme.onSurface,
                        ) ??
                        context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? context.theme.colorScheme.primary : context.theme.colorScheme.onSurface,
                        ),
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: context.theme.colorScheme.primary,
                        )
                      : null,
                  onTap: () {
                    onSelected(item);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          16.height,
        ],
      ),
    );
  }

  Widget _buildCupertinoActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: SDText(
        hintText ?? 'Seçiniz',
        style: textStyle?.copyWith(
              fontWeight: FontWeight.w500,
            ) ??
            context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      actions: items.map((item) {
        final isSelected = item == selectedItem;
        return CupertinoActionSheetAction(
          onPressed: () {
            onSelected(item);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SDText(
                item.toString(),
                style: textStyle?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.label,
                    ) ??
                    context.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? CupertinoColors.activeBlue : CupertinoColors.label,
                    ),
              ),
              if (isSelected)
                Icon(
                  CupertinoIcons.check_mark,
                  color: CupertinoColors.activeBlue,
                  size: 20,
                ),
            ],
          ),
        );
      }).toList(),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: SDText(
          'İptal',
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}
