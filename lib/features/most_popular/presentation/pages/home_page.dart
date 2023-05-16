import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/most_popular_bloc.dart';
import '../widgets/most_popular_sliverlist.dart';
import '../../../../core/utils/enums.dart';

import '../widgets/most_popular_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final option = ValueNotifier<MostOption>(MostOption.emailed);

  final period = ValueNotifier<Period>(Period.one);

  final hide = ValueNotifier<bool>(false);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse &&
                !(hide.value)) {
              hide.value = true;
            } else if (scrollController.position.userScrollDirection ==
                    ScrollDirection.forward &&
                hide.value) {
              hide.value = false;
            }
            return false;
          },
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              MostPopularAppBar(option: option, period: period),
              const MostPopularSliverList(),
            ],
          ),
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: hide,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.identity()..translate(0.0, value ? 100.0 : 0.0),
            child: child,
          );
        },
        child: FloatingActionButton(
          backgroundColor: Colors.black54,
          onPressed: () => context.read<MostPopularBloc>().add(
                MostPopularSubmitEvent(option.value, period.value),
              ),
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
