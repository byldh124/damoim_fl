import 'package:damoim/application/config/component/custom_text_form_field.dart';
import 'package:damoim/core/domain/model/entity/group_item_model.dart';
import 'package:damoim/features/home/provider/group_list_provider.dart';
import 'package:damoim/features/home/provider/state/group_list_ui_state.dart';
import 'package:damoim/features/home/widget/group_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSearchScreen extends ConsumerStatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  ConsumerState<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends ConsumerState<HomeSearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(groupSearchProvider(query));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(onChanged: (t) {
            setState(() {
              query = t;
            });
          }),
        ),
        if (state.isEmpty) _emptyMessage(),
        if (state.isNotEmpty) _buildList(state)
      ],
    );
  }

  Widget _buildList(List<GroupItemModel> state) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: state.length,
        itemBuilder: (context, index) {
          final item = state[index];
          return GroupCard(model: item);
        },
      ),
    );
  }

  Widget _emptyMessage() {
    return Center(
      child: Text('검색결과 없음'),
    );
  }
}
