part of 'bottomnavigation_bloc.dart';

abstract class BottomnavigationEvent extends Equatable {
  const BottomnavigationEvent() : super();
  @override
  List<Object?> get props => [];
}

class PageChanged extends BottomnavigationEvent {
  final int index;
  const PageChanged(this.index);

  @override
  List<Object?> get props => [];
}
