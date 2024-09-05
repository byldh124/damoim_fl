import 'package:damoim/core/domain/model/group_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_item_dto.g.dart';

@JsonSerializable()
class GroupItemDto {
  final String no;
  final String title;
  final String location;
  final String purpose;
  final String interest;
  final String thumb;
  final String image;
  final String information;
  final String masterId;

  GroupItemDto(this.no, this.title, this.location, this.purpose, this.interest, this.thumb,
      this.image, this.information, this.masterId);

  factory GroupItemDto.fromJson(Map<String, dynamic> json) => _$GroupItemDtoFromJson(json);

  GroupItemModel toDomainModel() {
    return GroupItemModel(
      int.parse(no),
      title,
      location,
      purpose,
      interest,
      thumb,
      image,
      information,
      masterId,
    );
  }
}
