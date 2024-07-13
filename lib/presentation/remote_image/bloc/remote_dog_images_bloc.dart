import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/get_dog_images_usecase.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/save_dog_image_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// clean_architecture_layer_exam_pre
/// File Name: remote_dog_images_bloc
/// Created by sujangmac
///
/// Description:
///
part 'remote_dog_images_event.dart';
part 'remote_dog_images_state.dart';

@injectable
class RemoteDogImagesBloc
    extends Bloc<RemoteDogImagesEvent, RemoteDogImagesState> {
  RemoteDogImagesBloc(
    GetDogImagesUseCase getDogImagesUseCase,
    SaveDogImageUseCase saveDogImageUseCase,
  )   : _getDogImagesUseCase = getDogImagesUseCase,
        _saveDogImageUseCase = saveDogImageUseCase,
        super(const RemoteDogImagesLoading()) {
    on<GetRemoteDogImagesEvent>(_onGetDogImages);
    on<SaveRemoteDogImageEvent>(_onSaveDogImage);
  }

  final GetDogImagesUseCase _getDogImagesUseCase;
  final SaveDogImageUseCase _saveDogImageUseCase;

  void _onGetDogImages(
    GetRemoteDogImagesEvent event,
    Emitter<RemoteDogImagesState> emit,
  ) async {
    emit(const RemoteDogImagesLoading());
    final data = await _getDogImagesUseCase.call(
      true,
      onError: (error) async => emit(RemoteDogImagesError(error.toString())),
    );
    emit(RemoteDogImagesLoaded(data));
  }

  void _onSaveDogImage(
    SaveRemoteDogImageEvent event,
    Emitter<RemoteDogImagesState> emit,
  ) async {
    await _saveDogImageUseCase.call(event.dogImage,
        onError: (error) async => emit(RemoteDogImagesError(error.toString())));
  }
}
