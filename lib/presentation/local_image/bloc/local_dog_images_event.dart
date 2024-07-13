///
/// clean_architecture_layer_exam_pre
/// File Name: local_dog_images_event
/// Created by sujangmac
///
/// Description:
///
part of 'local_dog_images_bloc.dart';

sealed class LocalDogImagesEvent extends Equatable {
  const LocalDogImagesEvent();

  @override
  List<Object> get props => [];
}

final class GetLocalDogImagesEvent extends LocalDogImagesEvent {
  const GetLocalDogImagesEvent();
}

final class DeleteDogImageEvent extends LocalDogImagesEvent {
  final String id;
  const DeleteDogImageEvent(this.id);
}

final class ClearDogImagesEvent extends LocalDogImagesEvent {
  const ClearDogImagesEvent();
}
