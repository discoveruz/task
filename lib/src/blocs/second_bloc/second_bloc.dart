import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/src/data/model/books_model.dart';
import 'package:task/src/data/model/pupils_model.dart';
import 'package:task/src/data/provider/second_provider.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc() : super(SecondInitial()) {
    on<SecondFetch>((event, emit) async {
      emit(SecondInitial());
      var data = await SecondApi.getBookStoredata();
      if (data is BookStore) {
        data.sold!.forEach((element) {
          data.books = data.books!.map((book) {
            int score = 0;
            if (element.bookId == book.id) {
              score++;
            }
            return Book(
              id: book.id,
              count: book.count! + score,
              name: book.name,
            );
          }).toList();
        });
        int count1 = data.sold!
            .where((element) => element.date == DateTime(2021, 3, 6))
            .length;
        int count2 = data.sold!
            .where((element) => element.date == DateTime(2021, 3, 7))
            .length;

        data.books!.sort((a, b) => a.count!.compareTo(b.count!));
        data.percentage = (count1 - count2) / count1 * 100;
        emit(SecondLoaded(data));
      } else if (data is ErorrModel) {
        emit(SecondError(data));
      }
    });
  }
}
