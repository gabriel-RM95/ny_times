import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ny_times/core/service_locator.dart';
import 'package:ny_times/features/most_popular/presentation/bloc/details/bloc/details_bloc.dart';

import '../bloc/home/most_popular_bloc.dart';

class MostPopularSliverList extends StatelessWidget {
  const MostPopularSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<DetailsBloc>(),
      child: BlocBuilder<MostPopularBloc, MostPopularState>(
        builder: (context, state) {
          if (state is MostPopularLoading) {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is MostPopularLoaded) {
            final results = state.responseEntity.results;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    onTap: () {
                      context.read<DetailsBloc>().add(DetailsSelectEvent(
                          state.responseEntity.results[index]));
                      context.pushNamed('details');
                    },
                    leading: results[index].media.isNotEmpty &&
                            results[index].media[0].images.isNotEmpty
                        ? Hero(
                            tag: results[index].media[0].images[0].url,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                results[index].media[0].images[0].url,
                                height: 50,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return CircularProgressIndicator(
                                        value: (loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!)
                                            .toDouble());
                                  }
                                },
                              ),
                            ),
                          )
                        : null,
                    title: Text(results[index].title),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(results[index].type),
                        ),
                        Flexible(child: Text(results[index].byline)),
                      ],
                    ),
                    tileColor: Colors.black26,
                  ),
                ),
                childCount: state.responseEntity.numResults,
              ),
            );
          } else {
            return SliverFillRemaining(
              child: Center(
                child: Text((state as MostPopularFailure).error),
              ),
            );
          }
        },
      ),
    );
  }
}
