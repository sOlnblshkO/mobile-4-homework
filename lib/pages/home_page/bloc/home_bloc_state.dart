// должно быть переделано под freezed
import 'package:bloc_example/pages/home_page/bloc/state_data/home_map_model.dart';

abstract class HomeBlocState {}

class LoadingState extends HomeBlocState {}

class ErrorState extends HomeBlocState {
  String errorMessage;

  ErrorState({
    required this.errorMessage,
  });
}

class LoadedState extends HomeBlocState {
  HomeMapModel homeMapModel;

  LoadedState({
    required this.homeMapModel,
  });
}
