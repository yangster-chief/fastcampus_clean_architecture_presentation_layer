import 'package:clean_architecture_layer_exam/presentation/bloc/dog_images_bloc.dart';
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
    context.read<DogImagesBloc>().add(const GetRemoteDogImagesEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DogImagesBloc, DogImagesState>(
        builder: (context, state) {
          if (state is RemoteDogImagesLoading) {
            return const LoadingDogCardFrame();
          } else if (state is RemoteDogImagesLoaded) {
            final cards = state.remoteImages.map(DogImageCard.new).toList();

            return RemoteDogCardFrame(
              items: state.remoteImages,
              controller: controller,
              onSwipe: _onSwipe,
              cards: cards,
              onRefresh: () {
                context
                    .read<DogImagesBloc>()
                    .add(const GetRemoteDogImagesEvent());
              },
              onSave: () {
                context.read<DogImagesBloc>().add(
                      SaveDogImageEvent(
                        state.remoteImages[_currentIndex],
                      ),
                    );
                showToastMessage(
                    'item ${state.remoteImages[_currentIndex].id} saved');
                controller.swipe(CardSwiperDirection.right);
              },
            );
          } else {
            return RefreshDogCardFrame(
                text: 'Error',
                onRefresh: () {
                  context
                      .read<DogImagesBloc>()
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
