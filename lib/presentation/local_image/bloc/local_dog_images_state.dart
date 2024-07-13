///
/// clean_architecture_layer_exam_pre
/// File Name: local_dog_image_state
/// Created by sujangmac
///
/// Description:
///
part of 'local_dog_images_bloc.dart';

sealed class LocalDogImagesState extends Equatable {
  final List<DogImage> image;
  final String error;
  const LocalDogImagesState({
    this.image = const [],
    this.error = '',
  });

  @override
  List<Object> get props => [image, error];
}

final class LocalDogImagesLoading extends LocalDogImagesState {
  const LocalDogImagesLoading();
}

final class LocalDogImagesLoaded extends LocalDogImagesState {
  const LocalDogImagesLoaded(List<DogImage> images) : super(image: images);
}

final class LocalDogImagesIsEmpty extends LocalDogImagesState {
  const LocalDogImagesIsEmpty();
}

final class LocalDogImagesError extends LocalDogImagesState {
  const LocalDogImagesError(String error) : super(error: error);
}
