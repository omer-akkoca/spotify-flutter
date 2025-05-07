import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  BasicAppBar({super.key, this.title,});

  final Color darkModeBg = Colors.white.withValues(alpha: 0.03);
  final Color lightModeBg = Colors.black.withValues(alpha: 0.04);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode ? darkModeBg : lightModeBg,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      title: title ?? Text(""),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
