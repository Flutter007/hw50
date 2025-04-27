import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String txt;
  const CustomText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      txt,
      style: theme.textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
