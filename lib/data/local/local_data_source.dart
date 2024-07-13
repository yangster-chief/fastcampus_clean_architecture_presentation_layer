import 'package:clean_architecture_layer_exam/data/local/model/dog_image_model.dart';
import 'package:clean_architecture_layer_exam/di/hive/hive_service.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: local_datasource
/// Created by sujangmac
///
/// Description:
///
@singleton
class LocalDataSource {
  final HiveService _hive;

  const LocalDataSource(this._hive);

  List<DogImageModel> getDogImages() {
    final box = _hive.dogImage;
    final dogImages = box.values.toList()..shuffle();
    return dogImages.take(10).toList();
  }

  void saveDogImage(DogImageModel dogImageModel) {
    final box = _hive.dogImage;
    box.put(dogImageModel.id, dogImageModel);
  }

  void deleteDogImage(String id) {
    final box = _hive.dogImage;
    box.delete(id);
  }

  void clearDogImages() {
    final box = _hive.dogImage;
    box.clear();
  }

  @disposeMethod
  void dispose() async {
    _hive.close();
  }
}
