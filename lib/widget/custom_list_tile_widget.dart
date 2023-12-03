import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/people.dart';

class CustomListTileWidget extends ConsumerWidget {
  const CustomListTileWidget(this.people, {super.key});

  final People people;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      width: 100,
      child: ListTile(
        title: Text(people.family),
        subtitle: Text(people.name),
      ),
    );
  }
}
