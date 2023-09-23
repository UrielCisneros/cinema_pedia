import 'package:cinema_pedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: HomeScreen.pathName,
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.pathName,
          builder: (context, state) =>
              MovieScreen(movieId: state.pathParameters['id'] ?? 'no-id'),
        )
      ]),
]);
