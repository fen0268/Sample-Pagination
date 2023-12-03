import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:samp_pagination/controller/content_controller.dart';

import '../../../controller/current_page_controller.dart';

class PaginationWidget extends ConsumerWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在のページ数を取得
    final currentPage = ref.watch(currentPageNotifierProvider);

    // 総件数を取得
    final data = ref.watch(fetchAllContentProvider).value?.length;

    // 1 ページあたりの表示件数
    const itemsPerPage = 10;

    // 総件数が 0 または null の場合は Pagination を表示しない
    if (data == null || data == 0) {
      return const SizedBox();
    }

    return WebPagination(
      // ボタンが押されたタイミングでの処理
      onPageChanged: (page) {
        ref.read(currentPageNotifierProvider.notifier).changePage(page);
        // ref.read(scrollNotifierProvider.notifier).scrollToTop();
      },

      // 現在のページ数
      currentPage: currentPage,

      // 総ページ数
      // currentPage が 1 から始まるため、1 を足す
      // (data - 1) は data が [itemsPerPage] の値の倍数のとき、
      // -1 をしないと総ページ数が 1 増えてしまうため、-1 をする
      totalPage: (data - 1) ~/ itemsPerPage + 1,

      // 表示するボタン数
      displayItemCount: 7,
    );
  }
}
