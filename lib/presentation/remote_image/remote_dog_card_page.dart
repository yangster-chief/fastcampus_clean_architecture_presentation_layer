import 'package:clean_architecture_layer_exam/presentation/local_image/bloc/local_dog_images_bloc.dart';
import 'package:clean_architecture_layer_exam/presentation/remote_image/bloc/remote_dog_images_bloc.dart';
import 'package:clean_architecture_layer_exam/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// clean_architecture_layer_exam
/// File Name: remote_dog_card_page
/// Created by sujangmac
///
/// Description:
///
class RemoteDogCardPage extends StatefulWidget {
  const RemoteDogCardPage({super.key});

  @override
  State<RemoteDogCardPage> createState() => _RemoteDogCardPageState();
}

class _RemoteDogCardPageState extends State<RemoteDogCardPage> {
  final CardSwiperController controller = CardSwiperController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RemoteDogImagesBloc>().add(const GetRemoteDogImagesEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RemoteDogImagesBloc, RemoteDogImagesState>(
        builder: (context, state) {
          if (state is RemoteDogImagesLoading) {
            return const LoadingDogCardFrame();
          } else if (state is RemoteDogImagesLoaded) {
            final cards = state.images.map(DogImageCard.new).toList();

            return RemoteDogCardFrame(
              items: state.images,
              controller: controller,
              onSwipe: _onSwipe,
              cards: cards,
              onRefresh: () {
                context
                    .read<RemoteDogImagesBloc>()
                    .add(const GetRemoteDogImagesEvent());
              },
              onSave: () {
                context
                    .read<LocalDogImagesBloc>()
                    .add(SaveDogImageEvent(state.images[_currentIndex]));
                showToastMessage(
                    'item ${state.images[_currentIndex].id} saved');
                controller.swipe(CardSwiperDirection.right);
              },
            );
          } else {
            return RefreshDogCardFrame(
                text: 'Error',
                onRefresh: () {
                  context
                      .read<RemoteDogImagesBloc>()
                      .add(const GetRemoteDogImagesEvent());
                });
          }
        },
      );

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    _currentIndex = currentIndex ?? 0;
    return true;
  }
}
