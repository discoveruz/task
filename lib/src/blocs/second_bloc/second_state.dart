part of 'second_bloc.dart';

abstract class SecondState extends Equatable {
  const SecondState();

  @override
  List<Object> get props => [];
}

class SecondInitial extends SecondState {}

class SecondLoaded extends SecondState {
  final BookStore bookStore;
  const SecondLoaded(this.bookStore);
  @override
  List<Object> get props => [bookStore];
}

class SecondError extends SecondState {
  final ErorrModel error;
  const SecondError(this.error);
}
