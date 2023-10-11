import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../features/auth/views/sign_in_view.dart';
import '../features/auth/views/user_view.dart';
import '../features/fuel/views/fuel_view.dart';
import '../features/home/views/home_view.dart';
import '../features/ticket/views/ticket_form_view.dart';
import '../features/ticket/views/ticket_view.dart';
import '../features/vehicle/views/assignment_view.dart';
import '../features/vehicle/views/vehicle_view.dart';
import 'services.dart';

part 'router.gr.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      CustomRoute(
        page: HomeRoute.page,
        guards: [_AuthGuard()],
        initial: true,
        children: [
          CustomRoute(
            page: TicketRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            maintainState: false,
          ),
          CustomRoute(page: TicketFromRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(page: VehicleRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn, maintainState: false),
          CustomRoute(page: AssignmentRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(page: FuelRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
          CustomRoute(page: UserRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        ],
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        page: SignInRoute.page,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
    ];
  }
}

/// The guarded screen requires an authenticated user
class _AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authController.loggedIn) {
      // If the user is authenticated, continue
      resolver.next(true);
    } else {
      // Otherwise, redirect to the sign in view
      router.push(SignInRoute());
    }
  }
}
