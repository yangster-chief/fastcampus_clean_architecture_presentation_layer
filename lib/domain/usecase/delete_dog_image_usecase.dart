import 'package:clean_architecture_layer_exam/domain/data_repository.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: delete_dog_image_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class DeleteDogImageUseCase implements UseCase<void, String> {
  final DataRepository _dataRepository;

  const DeleteDogImageUseCase(this._dataRepository);

  @override
  Future<void> call(String params, {required ResultErrorCallback onError}) async {
    final res = await _dataRepository.deleteDogImage(params);
    if(res is ResultError){
      onError(res.error!);
    }
  }
}