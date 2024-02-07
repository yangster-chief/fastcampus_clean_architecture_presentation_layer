///
/// clean_architecture_layer_exam
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
