import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:clean_architecture_layer_exam/domain/usecase/get_dog_images_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

///
/// clean_architecture_layer_exam
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
  )   : _getDogImagesUseCase = getDogImagesUseCase,
        super(const RemoteDogImagesLoading()) {
    on<GetRemoteDogImagesEvent>(_onGetDogImages);
  }

  final GetDogImagesUseCase _getDogImagesUseCase;

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
}
