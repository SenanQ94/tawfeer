import 'package:flutter/material.dart';
import 'package:tawfeer/utils/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title, subtitle;
  final Widget? trailing;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
    );
  }
}
