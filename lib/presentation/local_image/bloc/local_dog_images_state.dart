///
/// clean_architecture_layer_exam
/// File Name: local_dog_images_state
/// Created by sujangmac
///
/// Description:
///
part of 'local_dog_images_bloc.dart';

sealed class LocalDogImagesState extends Equatable {
  final List<DogImage> images;
  final String error;
  const LocalDogImagesState({
    this.images = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [images, error];
}

class LocalDogImagesLoading extends LocalDogImagesState {
  const LocalDogImagesLoading();
}

class LocalDogImagesLoaded extends LocalDogImagesState {
  const LocalDogImagesLoaded(List<DogImage> images) : super(images: images);
}

class LocalDogImagesIsEmpty extends LocalDogImagesState {
  const LocalDogImagesIsEmpty();
}

class LocalDogImagesError extends LocalDogImagesState {
  const LocalDogImagesError(String error) : super(error: error);
}
