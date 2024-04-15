import 'package:bloc_example/components/my_app_bar.dart';
import 'package:bloc_example/components/my_app_button.dart';
import 'package:bloc_example/pages/home_page/bloc/home_bloc.dart';
import 'package:bloc_example/pages/home_page/bloc/home_bloc_state.dart';
import 'package:bloc_example/pages/home_page/widgets/list_with_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(), // todo запустить inital загрузку
      child: const Scaffold(
        appBar: MyAppBar(
          appBarText: 'Задание с блоком и freezed',
        ),
        body: _MyHomeView(),
      ),
    );
  }
}

class _MyHomeView extends StatelessWidget {
  const _MyHomeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
      builder: (context, state) {
        // todo вместо if/if else/if else должен быть pattern matching
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is LoadedState) {
          final mapModel = state.homeMapModel;
          return Column(
            children: [
              ListWithLoadingWidget(
                isLoading: mapModel.isLoading1,
                data: mapModel.data1,
              ),
              MyAppButton(
                buttonText: 'Click 1',
                onClick: () {
                  // todo запуск действия для блока по загрузке первого списка
                },
              ),
              ListWithLoadingWidget(
                isLoading: mapModel.isLoading2,
                data: mapModel.data2,
              ),
              MyAppButton(
                buttonText: 'Click 2',
                onClick: () {
                  // todo запуск действия для блока по загрузке второго списка
                },
              ),
            ],
          );
        }
        return const Center(
          child: Text('Ты чо дурак?'),
        );
      },
    );
  }
}
