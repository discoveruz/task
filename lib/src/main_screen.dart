import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/blocs/bottom_bloc/bottomnavigation_bloc.dart';
import 'package:task/src/blocs/home_bloc/home_bloc.dart';
import 'package:task/src/blocs/second_bloc/second_bloc.dart';
import 'package:task/src/ui/home_page.dart';
import 'package:task/src/ui/second_page.dart';

class MainSceen extends StatefulWidget {
  const MainSceen({Key? key}) : super(key: key);

  @override
  State<MainSceen> createState() => _MainSceenState();
}

class _MainSceenState extends State<MainSceen> {
  late List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      BlocProvider.value(
          value: HomeBloc()..add(const HomeFetch()), child: const HomePage()),
      BlocProvider.value(
          value: SecondBloc()..add(const SecondFetch()),
          child: const SecondPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<BottomnavigationBloc>().add(PageChanged(index));
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Second',
              ),
            ],
          ),
        );
      },
    );
  }
}
