import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leadingWidget,
    this.action,
  });

  final Widget? leadingWidget;
  final Widget? action;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.leadingWidget?.padding(horizontal: 20) ?? const SizedBox(),
        widget.action?.padding(horizontal: 20) ?? const SizedBox.shrink(),
      ],
    ).safeArea(top: true, bottom: false);
  }
}
