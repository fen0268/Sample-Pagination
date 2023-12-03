import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/people.dart';
import 'current_page_controller.dart';

final client = Supabase.instance.client;

/// 全件取得する
/// Pagination の際にデータを区切るので総データ数を把握しておかなといけない
final fetchAllPeopleProvider = StreamProvider.autoDispose<List<People>>(
  (ref) async* {
    final data = await client
        .from('people')
        .select<PostgrestList>('family, name')
        .order('id', ascending: false);
    yield data.map(People.fromJson).toList();
  },
);

/// currentPageNotifierProvider の値に応じて、データを取得する
final fetchPerPagePeopleProvider = StreamProvider.autoDispose<List<People>>(
  (ref) async* {
    final currentPage = ref.watch(currentPageNotifierProvider);

    final data = await client
        .from('people')
        .select<PostgrestList>('family, name')
        .order('id', ascending: false)

        // 本サンプルでは 1 ページあたり 10 件表示する
        .range(currentPage * 10 - 10, currentPage * 10 - 1)
        .limit(10);
    yield data.map(People.fromJson).toList();
  },
);
