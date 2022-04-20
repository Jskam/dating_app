import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DataBaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscription;

  ImagesBloc({required DataBaseRepository dataBaseRepository})
      : _databaseRepository = dataBaseRepository,
        super(ImagesLoading()) {
    on<LoadImages>(_onLoadImages);
    on<UpdateImages>(_onUpdateImages);
  }

  void _onLoadImages(
    LoadImages event,
    Emitter<ImagesState> emit,
  ) {
    _databaseSubscription?.cancel();

    _databaseRepository.getUser().listen(
          (user) => add(
            UpdateImages(user.imageUrls),
          ),
        );
  }

  void _onUpdateImages(
    UpdateImages event,
    Emitter<ImagesState> emit,
  ) {
    emit(ImagesLoaded(imageUrls: event.imageUrls));
  }
}
