import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'custom_image.g.dart';

@JsonSerializable()
class CustomImage {
  final String? customImage;

  CustomImage({
    this.customImage,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CustomImage.fromJson(Map<String, dynamic> json) =>
      _$CustomImageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CustomImageToJson(this);

  @override
  List<Object?> get props => [
        customImage,
      ];
}
