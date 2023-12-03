import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/content.dart';

class CustomListTileWidget extends ConsumerWidget {
  const CustomListTileWidget(this.content, {super.key});

  final Content content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      width: 100,
      child: ListTile(
        title: Text(content.title),
        subtitle: Text(content.content),
      ),
    );
  }
}
