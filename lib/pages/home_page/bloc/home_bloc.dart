import 'dart:async';

import 'package:bloc_example/pages/home_page/bloc/home_bloc_event.dart';
import 'package:bloc_example/pages/home_page/bloc/home_bloc_state.dart';
import 'package:bloc_example/pages/home_page/bloc/state_data/home_map_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// должно быть переделано под freezed
class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(LoadingState()) {
    on<Load1>(startLoadFirstListData);
    on<Load2>(startLoadSecondListData);
    on<InitialLoading>(startInitialLoading);
  }

  FutureOr<void> startLoadFirstListData(
    Load1 event,
    Emitter<HomeBlocState> emit,
  ) {
    // todo делаем загрузку для первого листа
    // эмитим state loaded, но меняем состояние для isLoading1 и данные для массива data1
    // если все сделаете правильно то mapModel нужно обновлять не задавая новое значение, а через copywith
  }

  FutureOr<void> startLoadSecondListData(
    Load2 event,
    Emitter<HomeBlocState> emit,
  ) {
    // todo делаем загрузку для второго листа
    // эмитим state loaded, но меняем состояние для isLoading2 и данные для массива data2
    // если все сделаете правильно то mapModel нужно обновлять не задавая новое значение, а через copywith
  }

  Future<FutureOr<void>> startInitialLoading(
    InitialLoading event,
    Emitter<HomeBlocState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(
      LoadedState(
        homeMapModel: HomeMapModel(
          data1: ['something', 'asd', 'qwe', 'zxc', 'qweqwe', 'something'],
          isLoading1: false,
          data2: ['something 123'],
          isLoading2: false,
        ),
      ),
    );
  }
}
