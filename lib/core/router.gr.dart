// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AssignmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssignmentView(),
      );
    },
    FuelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FuelView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInView(key: args.key),
      );
    },
    TicketFromRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketFromView(),
      );
    },
    TicketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketView(),
      );
    },
    UserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserView(),
      );
    },
    VehicleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VehicleView(),
      );
    },
  };
}

/// generated route for
/// [AssignmentView]
class AssignmentRoute extends PageRouteInfo<void> {
  const AssignmentRoute({List<PageRouteInfo>? children})
      : super(
          AssignmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssignmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FuelView]
class FuelRoute extends PageRouteInfo<void> {
  const FuelRoute({List<PageRouteInfo>? children})
      : super(
          FuelRoute.name,
          initialChildren: children,
        );

  static const String name = 'FuelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TicketFromView]
class TicketFromRoute extends PageRouteInfo<void> {
  const TicketFromRoute({List<PageRouteInfo>? children})
      : super(
          TicketFromRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketFromRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketView]
class TicketRoute extends PageRouteInfo<void> {
  const TicketRoute({List<PageRouteInfo>? children})
      : super(
          TicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserView]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VehicleView]
class VehicleRoute extends PageRouteInfo<void> {
  const VehicleRoute({List<PageRouteInfo>? children})
      : super(
          VehicleRoute.name,
          initialChildren: children,
        );

  static const String name = 'VehicleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
