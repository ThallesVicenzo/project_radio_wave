import 'package:equatable/equatable.dart';
import 'package:radio_wave/core/domain/entities/radio_entity.dart';
import 'package:radio_wave/core/errors/failure.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  final List<RadioEntity> radioEntity;
  const HomeSuccessState(this.radioEntity);
}

class HomeErrorState extends HomeState {
  final Failure failure;
  const HomeErrorState(this.failure);
}
