import 'package:clean_architecture_layer_exam/domain/data_repository.dart';
import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: get_dog_images_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class GetDogImagesUseCase implements UseCase<List<DogImage>, bool> {
  final DataRepository _dataRepository;

  const GetDogImagesUseCase(this._dataRepository);

  @override
  Future<List<DogImage>> call(bool params,
      {required ResultErrorCallback onError}) async {
    final res = await _dataRepository.getDogImages(params);
    if (res is ResultError) {
      onError(res.error!);
    }
    return res.data ?? [];
  }
}
