import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../utils/enums.dart';
import '../../features/most_popular/presentation/pages/details_page.dart';
import '../../features/most_popular/presentation/pages/home_page.dart';

import '../../features/most_popular/presentation/bloc/home/most_popular_bloc.dart';

class MyRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => MostPopularBloc()
            ..add(
              const MostPopularSubmitEvent(MostOption.emailed, Period.one),
            ),
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: '/details',
        name: 'details',
        builder: (context, state) => const DetailsPage(),
      ),
    ],
  );
}
