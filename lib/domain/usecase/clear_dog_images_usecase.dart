import 'package:clean_architecture_layer_exam/domain/data_repository.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: clear_dog_images_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class ClearDogImagesUseCase implements UseCase<void, void> {
  final DataRepository _dataRepository;

  const ClearDogImagesUseCase(this._dataRepository);

  @override
  Future<void> call(void params, {required ResultErrorCallback onError}) async {
    final res = await _dataRepository.clearDogImages();
    if (res is ResultError) {
      onError(res.error!);
    }
  }
}
