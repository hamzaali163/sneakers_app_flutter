import 'package:ecommerce_app/respository/components/app_styles.dart';
import 'package:flutter/material.dart';

class AppBarComp extends StatelessWidget implements PreferredSizeWidget {
  final String apptitle;
  final List<Widget> actions;
  final IconButton? appleading;
  final Color color;

  const AppBarComp({
    super.key,
    this.apptitle = '',
    this.actions = const [],
    this.appleading,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Text(apptitle),
      titleTextStyle: TextStyling.apptitle,
      leading: appleading,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
