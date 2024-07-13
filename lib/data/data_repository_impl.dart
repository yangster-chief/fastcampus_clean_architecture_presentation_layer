import 'package:clean_architecture_layer_exam/data/local/local_data_source.dart';
import 'package:clean_architecture_layer_exam/data/local/model/dog_image_model.dart';
import 'package:clean_architecture_layer_exam/data/remote/remote_data_source.dart';
import 'package:clean_architecture_layer_exam/domain/data_repository.dart';
import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/result.dart';
import 'package:clean_architecture_layer_exam/data/remote/model/image_response.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: data_repsotory_impl
/// Created by sujangmac
///
/// Description:
///
@LazySingleton(as: DataRepository)
class DataRepositoryImpl implements DataRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  const DataRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<DogImage>>> getDogImages(bool isRemote) =>
      executeSafe(() async {
        if (isRemote) {
          final images = await _remoteDataSource.getDogImages(10);
          return images.toEntities();
        }
        final images = _localDataSource.getDogImages();
        return images.toEntities();
      });

  @override
  Future<Result<void>> saveDogImage(DogImage dogImage) => executeSafe(() async {
        _localDataSource.saveDogImage(dogImage.toModel());
      });

  @override
  Future<Result<void>> deleteDogImage(String id) => executeSafe(() async {
        _localDataSource.deleteDogImage(id);
      });

  @override
  Future<Result<void>> clearDogImages() => executeSafe(() async {
        _localDataSource.clearDogImages();
      });
}
