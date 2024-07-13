import 'package:clean_architecture_layer_exam/data/local/model/breed_model.dart';
import 'package:clean_architecture_layer_exam/data/local/model/dog_image_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: hive_service
/// Created by sujangmac
///
/// Description:
///
class HiveService {
  static const String _dogImageBox = 'dog_image';
  static const String _breedBox = 'breed';
  static Future<HiveService> init() async {
    await Hive.initFlutter();
    //register adapter here
    Hive
      ..registerAdapter(DogImageModelAdapter()) // typeId = 0
      ..registerAdapter(BreedModelAdapter()); // typeId = 1
    //
    await Future.wait(boxes);
    return HiveService();
  }

  static final boxes = [
    Hive.openBox<DogImageModel>(_dogImageBox),
    Hive.openBox<BreedModel>(_breedBox),
  ];

  Box<DogImageModel> get dogImage => Hive.box<DogImageModel>(_dogImageBox);
  Box<BreedModel> get breed => Hive.box<BreedModel>(_breedBox);

  void close() {
    Hive.close();
  }
}
