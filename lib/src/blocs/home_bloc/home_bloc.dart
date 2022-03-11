import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/src/data/model/pupils_model.dart';
import 'package:task/src/data/provider/home_provider.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetch>((event, emit) async {
      emit(HomeInitial());
      var data = await HomeApi.getStudents();
      if (data is Pupils) {
        int summaOfScores = data.marks!
            .map((e) => e.score)
            .toList()
            .reduce((value, element) => value! + element!)!;
        double avarage = summaOfScores / data.students!.length;
        data.marks!.forEach((e) {
          data.students = data.students!.map((element) {
            int score = element.score!;
            if (element.id == e.userId) {
              score = element.score! + e.score!;
            }
            return Student(
              id: element.id,
              name: element.name,
              score: score,
            );
          }).toList();
        });
        data.avarage = avarage;
        data.students!.removeWhere((element) => element.score! < avarage);
        data.students!.sort((a, b) => b.score!.compareTo(a.score!));
        emit(HomeLoaded(data));
      } else if (data is ErorrModel) {
        emit(HomeError(data));
      }
    });
  }
}
