part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded(this.pupils);
  final Pupils pupils;
}
class HomeError extends HomeState {
  const HomeError(this.error);
  final ErorrModel error;
}