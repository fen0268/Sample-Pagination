import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samp_pagination/controller/content_controller.dart';
import 'package:samp_pagination/widget/custom_list_tile_widget.dart';
import 'package:samp_pagination/widget/pagination_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentList = ref.watch(fetchPerPageContentProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            contentList.when(
              data: (content) {
                if (content.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: content.map(CustomListTileWidget.new).toList(),
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
                child: SelectableText(error.toString()),
              ),
            ),
            const PaginationWidget(),
          ],
        ),
      ),
    );
  }
}
