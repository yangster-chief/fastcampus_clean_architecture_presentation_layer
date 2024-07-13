import 'package:clean_architecture_layer_exam/domain/data_repository.dart';
import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: save_dog_image_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class SaveDogImageUseCase implements UseCase<void, DogImage> {
  final DataRepository _dataRepository;

  const SaveDogImageUseCase(this._dataRepository);

  @override
  Future<void> call(DogImage params,
      {required ResultErrorCallback onError}) async {
    final res = await _dataRepository.saveDogImage(params);
    if (res is ResultError) {
      onError(res.error!);
    }
  }
}
