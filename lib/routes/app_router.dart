import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:profile_editor/features/profile/presentation/pages/edit_profile_view.dart';
import 'package:profile_editor/features/profile/presentation/pages/view_profile_view.dart';


class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ViewProfilePage();
        },
      ),
      GoRoute(
        path: '/edit',
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfilePage();
        },
      ),
    ],
  );
}