import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/content.dart';
import 'current_page_controller.dart';

final client = Supabase.instance.client;

// 全件取得する
final fetchAllContentProvider = StreamProvider.autoDispose<List<Content>>(
  (ref) async* {
    final data = await client
        .from('content')
        .select<PostgrestList>('title, content')
        .order('id', ascending: false);
    yield data.map(Content.fromJson).toList();
  },
);

final fetchPerPageContentProvider = StreamProvider.autoDispose<List<Content>>(
  (ref) async* {
    final currentPage = ref.watch(currentPageNotifierProvider);

    final data = await client
        .from('content')
        .select<PostgrestList>('title, content')
        .order('id', ascending: false)

        // 本サンプルでは 1 ページあたり 10 件表示する
        .range(currentPage * 10 - 10, currentPage * 10 - 1)
        .limit(10);
    yield data.map(Content.fromJson).toList();
  },
);
