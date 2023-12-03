import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/people_controller.dart';
import '../widget/custom_list_tile_widget.dart';
import '../widget/pagination_widget.dart';
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final peopleList = ref.watch(fetchPerPagePeopleProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            peopleList.when(
              data: (people) {
                if (people.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: people.map(CustomListTileWidget.new).toList(),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
            ),
            const PaginationWidget(),
          ],
        ),
      ),
    );
  }
}
