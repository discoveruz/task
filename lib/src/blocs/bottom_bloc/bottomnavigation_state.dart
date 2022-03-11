part of 'bottomnavigation_bloc.dart';

class BottomnavigationState extends Equatable {
  final int currentIndex;
  const BottomnavigationState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
