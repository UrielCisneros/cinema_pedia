import 'package:cinema_pedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.pathName,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  )
]);
