part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetch extends HomeEvent {
  const HomeFetch();
  @override
  List<Object> get props => [];
}
