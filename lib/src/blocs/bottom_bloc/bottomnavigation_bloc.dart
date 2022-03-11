import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc
    extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(const BottomnavigationState(currentIndex: 0)) {
    on<PageChanged>((event, emit) {
      emit(BottomnavigationState(currentIndex: event.index));
    });
  }
}
