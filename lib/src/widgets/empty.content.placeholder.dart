import 'package:flutter/material.dart';

import '../../shared_utils.dart';

class EmptyContentPlaceholder extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;

  const EmptyContentPlaceholder(
      {Key? key, required this.title, required this.subtitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...{
            Icon(icon, size: 48, color: context.colorScheme.primary).bottom(16),
          },
          title
              .h6(context,
                  color: context.colorScheme.secondary,
                  alignment: TextAlign.center)
              .bottom(8),
          subtitle.subtitle2(context,
              alignment: TextAlign.center, emphasis: kEmphasisMedium),
        ],
      ).horizontal(context.width * 0.1).centered();
}
