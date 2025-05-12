import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool  hideBack;
  final List<Widget>? actions;

  BasicAppBar({super.key, this.title, this.hideBack = false, this.actions});

  final Color darkModeBg = Colors.white.withValues(alpha: 0.03);
  final Color lightModeBg = Colors.black.withValues(alpha: 0.04);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: _buildLeading(context),
      actions: actions,
      title: title ?? Text(""),
    );
  }
  
  Widget _buildLeading(BuildContext context){
    if (hideBack) return SizedBox();
    return IconButton(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
