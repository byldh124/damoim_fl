import 'package:damoim/config/component/custom_text_form_field.dart';
import 'package:damoim/features/home/provider/group_list_provider.dart';
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
    debugPrint('state : ${state.map((e) => e.title)}');
    return CustomTextFormField(
      onChanged: (t) {
        setState(() {
          query = t;
        });
      },
    );
  }
}
