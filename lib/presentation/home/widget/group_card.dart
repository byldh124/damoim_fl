import 'package:damoim/config/style/color.dart';
import 'package:damoim/domain/model/group_item_model.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final GroupItemModel model;

  const GroupCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: GRAY_06),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    model.thumb,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.title),
                      Text(model.purpose),
                      Text(model.location),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
