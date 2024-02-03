import 'package:json_annotation/json_annotation.dart';

///
/// clean_architecture_layer_exam
/// File Name: image_response
/// Created by sujangmac
///
/// Description:
///
part 'image_response.g.dart';

@JsonSerializable()
class ImageResponse {
  final List<BreedResponse> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  const ImageResponse({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}

@JsonSerializable()
class BreedResponse {
  final SystemOfMeasurementResponse weight;
  final SystemOfMeasurementResponse height;
  final int id;
  final String name;
  @JsonKey(name: 'bred_for')
  final String? bredFor;
  @JsonKey(name: 'breed_group')
  final String? breedGroup;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  const BreedResponse({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
  });

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
}

@JsonSerializable()
class SystemOfMeasurementResponse {
  final String imperial;
  final String metric;

  const SystemOfMeasurementResponse({
    required this.imperial,
    required this.metric,
  });

  factory SystemOfMeasurementResponse.fromJson(Map<String, dynamic> json) =>
      _$SystemOfMeasurementResponseFromJson(json);
}
