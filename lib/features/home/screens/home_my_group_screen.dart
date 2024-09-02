import 'package:damoim/config/component/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMyGroupScreen extends ConsumerStatefulWidget {
  const HomeMyGroupScreen({super.key});

  @override
  ConsumerState<HomeMyGroupScreen> createState() => _HomeMyGroupScreenState();
}

class _HomeMyGroupScreenState extends ConsumerState<HomeMyGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('my group'),
    );
  }
}
