import 'package:damoim/config/component/default_layout.dart';
import 'package:damoim/config/const/data.dart';
import 'package:damoim/domain/repository/group_repository.dart';
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

  }
  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(groupRepositoryProvider);
    repository.getGroupList('test01', GroupType.ALL);
    return Center(
      child: Text('list'),
    );
  }
}
