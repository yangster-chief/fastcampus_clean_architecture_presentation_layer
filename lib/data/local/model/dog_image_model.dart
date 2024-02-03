import 'package:clean_architecture_layer_exam/data/local/model/breed_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// clean_architecture_layer_exam
/// File Name: dog_image_model
/// Created by sujangmac
///
/// Description:
///
part 'dog_image_model.g.dart';

@HiveType(typeId: 0)
class DogImageModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final int width;
  @HiveField(3)
  final int height;
  @HiveField(4)
  final List<BreedModel> breeds;

  const DogImageModel({
    this.id = '',
    this.url = '',
    this.width = 0,
    this.height = 0,
    this.breeds = const [],
  });
}
