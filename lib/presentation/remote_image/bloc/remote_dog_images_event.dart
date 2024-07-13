///
/// clean_architecture_layer_exam_pre
/// File Name: remote_dog_images_event
/// Created by sujangmac
///
/// Description:
///
part of 'remote_dog_images_bloc.dart';

sealed class RemoteDogImagesEvent extends Equatable {
  const RemoteDogImagesEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteDogImagesEvent extends RemoteDogImagesEvent {
  const GetRemoteDogImagesEvent();
}

final class SaveRemoteDogImageEvent extends RemoteDogImagesEvent {
  final DogImage dogImage;
  const SaveRemoteDogImageEvent(this.dogImage);
}
