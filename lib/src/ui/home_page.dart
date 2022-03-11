import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/blocs/home_bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            print(state.pupils.avarage);
            state.pupils.students!.forEach((student) {
              print("${student.name} ${student.score} ");
            });
            return ListView.builder(
              itemBuilder: (c, i) => ListTile(
                title: Text(state.pupils.students![i].name!),
                leading: Text(state.pupils.students![i].score.toString()),
                trailing: Text(state.pupils.avarage.toString()),
              ),
              itemCount: state.pupils.students!.length,
            );
          }
          if (state is HomeError) {
            return Center(
              child: Text(state.error.message),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
