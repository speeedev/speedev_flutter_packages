import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedev_ui/speedev_ui.dart';

class SDDropDown<T> extends StatefulWidget {
  final List<T> items;
  final Function(T) onSelected;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? hintText;
  final String? titleText;
  final String? cancelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? miniWidget;

  const SDDropDown({
    super.key,
    required this.items,
    required this.onSelected,
    this.backgroundColor,
    this.textStyle,
    this.hintText,
    this.titleText,
    this.cancelText,
    this.prefixIcon,
    this.suffixIcon,
    this.miniWidget = false,
  });

  @override
  State<SDDropDown<T>> createState() => _SDDropDownState<T>();
}

class _SDDropDownState<T> extends State<SDDropDown<T>> {
  T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSelectionSheet(context),
      child: widget.miniWidget == true
          ? IntrinsicWidth(
              child: Container(
                padding: SDPaddingValues.small.paddingValue.toEdgeInsets,
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(SDRadiusValues.small.radiusValue),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.prefixIcon != null) ...[
                      widget.prefixIcon!,
                      8.width,
                    ],
                    Flexible(
                      child: SDText(
                        selectedItem?.toString() ?? widget.hintText ?? " ",
                        style: widget.textStyle?.copyWith(
                              color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ) ??
                            context.theme.textTheme.bodyMedium?.copyWith(
                              color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                      ),
                    ),
                    widget.suffixIcon ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                  ],
                ),
              ),
            )
          : Container(
              padding: SDPaddingValues.large.paddingValue.toEdgeInsets,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(SDRadiusValues.small.radiusValue),
              ),
              child: Row(
                children: [
                  if (widget.prefixIcon != null) ...[
                    widget.prefixIcon!,
                    8.width,
                  ],
                  Expanded(
                    child: SDText(
                      selectedItem?.toString() ?? widget.hintText ?? " ",
                      style: widget.textStyle?.copyWith(
                            color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ) ??
                          context.theme.textTheme.bodyMedium?.copyWith(
                            color: selectedItem != null ? context.theme.colorScheme.onSurface : context.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                    ),
                  ),
                  widget.suffixIcon ??
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
              borderRadius: BorderRadius.circular(SDRadiusValues.small.radiusValue),
            ),
          ),
          16.height,
          Padding(
            padding: SDPaddingValues.medium.paddingValue.toEdgeInsetsOnlyHorizontal,
            child: Row(
              children: [
                SDText(
                  widget.titleText ?? " ",
                  style: widget.textStyle?.copyWith(
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
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = item == selectedItem;

                return ListTile(
                  title: SDText(
                    item.toString(),
                    style: widget.textStyle?.copyWith(
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
                    Navigator.pop(context);
                    setState(() {
                      selectedItem = item;
                    });
                    widget.onSelected(item);
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
        widget.titleText ?? " ",
        style: widget.textStyle?.copyWith(
              fontWeight: FontWeight.w500,
            ) ??
            context.theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      actions: widget.items.map((item) {
        final isSelected = item == selectedItem;
        return CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              selectedItem = item;
            });
            widget.onSelected(item);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SDText(
                item.toString(),
                style: widget.textStyle?.copyWith(
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
          widget.cancelText ?? "Cancel",
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}
