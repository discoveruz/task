import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/blocs/second_bloc/second_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SecondBloc, SecondState>(
        builder: (context, state) {
          if (state is SecondLoaded) {
            return ListView.builder(
              itemBuilder: (c, i) => ListTile(
                title: Text(state.bookStore.books![0].name!),
                leading: Text(state.bookStore.books![0].count.toString()),
                trailing: Text(state.bookStore.percentage.toStringAsFixed(2)+"% ga pastlagan"),
              ),
              itemCount: 1,
            );
          }
          if (state is SecondError) {
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
