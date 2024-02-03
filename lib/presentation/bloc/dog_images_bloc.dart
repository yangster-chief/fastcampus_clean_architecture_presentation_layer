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
/// File Name: dog_images_bloc
/// Created by sujangmac
///
/// Description:
///
part 'dog_images_event.dart';
part 'dog_images_state.dart';

@injectable
class DogImagesBloc extends Bloc<DogImagesEvent, DogImagesState> {
  DogImagesBloc(
    GetDogImagesUseCase getDogImagesUseCase,
    SaveDogImageUseCase saveDogImageUseCase,
    DeleteDogImageUseCase deleteDogImageUseCase,
    ClearDogImagesUseCase clearDogImagesUseCase,
  )   : _getDogImagesUseCase = getDogImagesUseCase,
        _saveDogImageUseCase = saveDogImageUseCase,
        _deleteDogImageUseCase = deleteDogImageUseCase,
        _clearDogImagesUseCase = clearDogImagesUseCase,
        super(const RemoteDogImagesLoading()) {
    on<GetRemoteDogImagesEvent>(_onGetRemoteDogImages);
    on<GetLocalDogImagesEvent>(_onGetLocalDogImages);
    on<SaveDogImageEvent>(_onSaveDogImage);
    on<DeleteDogImageEvent>(_onDeleteDogImage);
    on<ClearDogImagesEvent>(_onClearDogImages);
  }

  final GetDogImagesUseCase _getDogImagesUseCase;
  final SaveDogImageUseCase _saveDogImageUseCase;
  final DeleteDogImageUseCase _deleteDogImageUseCase;
  final ClearDogImagesUseCase _clearDogImagesUseCase;

  void _onGetRemoteDogImages(
    GetRemoteDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    emit(const RemoteDogImagesLoading());
    final data = await _getDogImagesUseCase.call(
      true,
      onError: (error) async => emit(RemoteDogImagesError(error.toString())),
    );
    emit(RemoteDogImagesLoaded(data));
  }

  void _onGetLocalDogImages(
    GetLocalDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    emit(const LocalDogImagesLoading());
    final data = await _getDogImagesUseCase.call(
      false,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
    if (data.isEmpty) {
      emit(const LocalDogImagesIsEmpty());
    } else {
      emit(LocalDogImagesLoaded(data));
    }
  }

  void _onSaveDogImage(
    SaveDogImageEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _saveDogImageUseCase.call(
      event.dogImage,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
  }

  void _onDeleteDogImage(
    DeleteDogImageEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _deleteDogImageUseCase.call(
      event.id,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
    add(const GetLocalDogImagesEvent());
  }

  void _onClearDogImages(
    ClearDogImagesEvent event,
    Emitter<DogImagesState> emit,
  ) async {
    await _clearDogImagesUseCase.call(
      null,
      onError: (error) async => emit(LocalDogImagesError(error.toString())),
    );
  }
}
