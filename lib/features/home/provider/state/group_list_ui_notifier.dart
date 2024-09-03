import 'package:damoim/config/const/data.dart';
import 'package:damoim/domain/repository/group_repository.dart';
import 'package:damoim/features/home/provider/state/group_list_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupListUiNotifier extends StateNotifier<GroupListUiState> {
  final GroupRepository groupRepository;

  GroupListUiNotifier({required this.groupRepository}) : super(Loading());

  void getList({required String id, required GroupType type}) async {
    final response = await groupRepository.getGroupList(id, type);
    if (response.success() && response.result != null) {
      if (response.result!.isNotEmpty) {
        state = Success(response.result!);
      } else {
        state = Error('해당 모임이 없습니다.');
      }
    } else {
      state = Error(response.message);
    }
  }

}