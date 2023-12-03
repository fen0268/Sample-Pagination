import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageNotifierProvider = AutoDisposeNotifierProvider<CurrentPageNotifier, int>(
  CurrentPageNotifier.new,
);

/// 現在のページ数を管理する
class CurrentPageNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    // ページ数を返す
    // 初期値は 1 ページ目のため 1 を返す
    return 1;
  }
  
  /// ボタンが押されたタイミングで更新をかける
  void changePage(int value) {
    state = value;
  }
}
