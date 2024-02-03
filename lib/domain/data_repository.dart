import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';

///
/// clean_architecture_layer_exam
/// File Name: data_repository
/// Created by sujangmac
///
/// Description:
///
abstract class DataRepository {
  Future<Result<List<DogImage>>> getDogImages(bool isRemote);
  Future<Result<void>> saveDogImage(DogImage dogImage);
  Future<Result<void>> deleteDogImage(String id);
  Future<Result<void>> clearDogImages();
}
