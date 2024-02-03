///
/// clean_architecture_layer_exam
/// File Name: dog_images_event
/// Created by sujangmac
///
/// Description:
///
part of 'dog_images_bloc.dart';

sealed class DogImagesEvent extends Equatable {
  const DogImagesEvent();

  @override
  List<Object> get props => [];
}

final class GetRemoteDogImagesEvent extends DogImagesEvent {
  const GetRemoteDogImagesEvent();
}

final class GetLocalDogImagesEvent extends DogImagesEvent {
  const GetLocalDogImagesEvent();
}

final class SaveDogImageEvent extends DogImagesEvent {
  final DogImage dogImage;

  const SaveDogImageEvent(this.dogImage);
}

final class DeleteDogImageEvent extends DogImagesEvent {
  final String id;

  const DeleteDogImageEvent(this.id);
}

final class ClearDogImagesEvent extends DogImagesEvent {
  const ClearDogImagesEvent();
}
