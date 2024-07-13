///
/// clean_architecture_layer_exam_pre
/// File Name: remote_dog_images_state
/// Created by sujangmac
///
/// Description:
///
part of 'remote_dog_images_bloc.dart';

sealed class RemoteDogImagesState extends Equatable {
  final List<DogImage> images;
  final String error;

  const RemoteDogImagesState({this.images = const [], this.error = ''});

  @override
  List<Object> get props => [images, error];
}

final class RemoteDogImagesLoading extends RemoteDogImagesState {
  const RemoteDogImagesLoading();
}

final class RemoteDogImagesLoaded extends RemoteDogImagesState {
  const RemoteDogImagesLoaded(List<DogImage> images) : super(images: images);
}

final class RemoteDogImagesError extends RemoteDogImagesState {
  const RemoteDogImagesError(String error) : super(error: error);
}
