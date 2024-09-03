import 'package:damoim/config/const/data.dart';
import 'package:damoim/features/home/provider/group_list_provider.dart';
import 'package:damoim/features/home/provider/state/group_list_ui_state.dart';
import 'package:damoim/features/home/widget/group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeListScreen extends ConsumerStatefulWidget {
  const HomeListScreen({super.key});

  @override
  ConsumerState<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends ConsumerState<HomeListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(groupListProvider.notifier).getList(id: 'test01', type: GroupType.ALL);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(groupListProvider);
    return Center(
      child: switch (state) {
        Success() => ListView.builder(
            shrinkWrap: false,
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              final item = state.list[index];
              return GroupCard(model: item);
            },
          ),
        Loading() => const Center(
            child: CircularProgressIndicator(),
          ),
        Error() => Center(
            child: Text(state.message),
          ),
      },
    );
  }
}
