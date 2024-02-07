import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/clear_dog_images_usecase.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/delete_dog_image_usecase.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/get_dog_images_usecase.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/save_dog_image_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam
/// File Name: local_dog_images_bloc
/// Created by sujangmac
///
/// Description:
///
part 'local_dog_images_event.dart';
part 'local_dog_images_state.dart';

@injectable
class LocalDogImagesBloc
    extends Bloc<LocalDogImagesEvent, LocalDogImagesState> {
  LocalDogImagesBloc(
    GetDogImagesUseCase getDogImagesUseCase,
    SaveDogImageUseCase saveDogImageUseCase,
    DeleteDogImageUseCase deleteDogImageUseCase,
    ClearDogImagesUseCase clearDogImagesUseCase,
  )   : _getDogImagesUseCase = getDogImagesUseCase,
        _saveDogImageUseCase = saveDogImageUseCase,
        _deleteDogImageUseCase = deleteDogImageUseCase,
        _clearDogImagesUseCase = clearDogImagesUseCase,
        super(const LocalDogImagesLoading()) {
    on<GetLocalDogImagesEvent>(_onGetDogImages);
    on<SaveDogImageEvent>(_onSaveDogImage);
    on<DeleteDogImageEvent>(_onDeleteDogImage);
    on<ClearDogImagesEvent>(_onClearDogImages);
  }

  final GetDogImagesUseCase _getDogImagesUseCase;
  final SaveDogImageUseCase _saveDogImageUseCase;
  final DeleteDogImageUseCase _deleteDogImageUseCase;
  final ClearDogImagesUseCase _clearDogImagesUseCase;

  void _onGetDogImages(
    GetLocalDogImagesEvent event,
    Emitter<LocalDogImagesState> emit,
  ) async {
    emit(const LocalDogImagesLoading());
    final data = await _getDogImagesUseCase.call(
      false,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
    emit(LocalDogImagesLoaded(data));
  }

  void _onSaveDogImage(
    SaveDogImageEvent event,
    Emitter<LocalDogImagesState> emit,
  ) async {
    await _saveDogImageUseCase.call(
      event.dogImage,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
  }

  void _onDeleteDogImage(
    DeleteDogImageEvent event,
    Emitter<LocalDogImagesState> emit,
  ) async {
    await _deleteDogImageUseCase.call(
      event.id,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
    add(const GetLocalDogImagesEvent());
  }

  void _onClearDogImages(
    ClearDogImagesEvent event,
    Emitter<LocalDogImagesState> emit,
  ) async {
    await _clearDogImagesUseCase.call(
      null,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
  }
}
