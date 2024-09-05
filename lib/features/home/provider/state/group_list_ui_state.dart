import 'package:damoim/core/domain/model/group_item_model.dart';

sealed class GroupListUiState {}

class Success extends GroupListUiState {
  List<GroupItemModel> list;

  Success(this.list);
}

class Loading extends GroupListUiState {}

class Error extends GroupListUiState {
  String message;

  Error(this.message);
}
