import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uzum_tezkor/src/common/localization/app_localizations.dart';

class InfoTileItem extends ConsumerWidget {
 const InfoTileItem({
    required this.subTitle,
    this.icon = Icons.home,
    this.title = "Uy",
    this.isSelected = false,
    this.isExistLeftIcon = false,
    super.key,
  });

  final String subTitle;
  final String title;
  final bool isSelected;
  final bool isExistLeftIcon;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color color = Theme.of(context).colorScheme.onPrimaryContainer;
    if (isSelected) {
      color = Colors.green;
    }
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withOpacity(0.2)),
            child: Icon(
              icon,
              size: 30,
              color: Colors.deepPurple,
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: color,
                ),
          ),
          subtitle: Text(
            subTitle,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: color,
                ),
          ),
          trailing: Icon(
            isSelected
                ? Icons.done
                : isExistLeftIcon
                    ? Icons.chevron_right
                    : null,
            color: color,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
      ],
    );
  }
}
