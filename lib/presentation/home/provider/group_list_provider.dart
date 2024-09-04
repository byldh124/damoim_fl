import 'package:damoim/domain/model/group_item_model.dart';
import 'package:damoim/domain/repository/group_repository.dart';
import 'package:damoim/presentation/home/provider/state/group_list_ui_notifier.dart';
import 'package:damoim/presentation/home/provider/state/group_list_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupListProvider = StateNotifierProvider<GroupListUiNotifier, GroupListUiState>((ref) {
  final groupRepository = ref.watch(groupRepositoryProvider);
  return GroupListUiNotifier(groupRepository: groupRepository);
});

final groupSearchProvider = Provider.family<List<GroupItemModel>, String>((ref, query) {
  if (query.isEmpty) return List.empty();
  final state = ref.watch(groupListProvider);
  if (state is! Success) {
    return List.empty();
  } else {
    return state.list.where((e) {
      return e.title.contains(query) ||
          e.purpose.contains(query) ||
          e.location.contains(query) ||
          e.information.contains(query);
    }).toList();
  }
});
