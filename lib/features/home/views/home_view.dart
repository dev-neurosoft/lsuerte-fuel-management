import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../core/constants.dart';
import '../../../core/extension.dart';
import '../../../core/router.dart';
import '../../../core/services.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final currentPath = ValueNotifier(router.urlState.path);

  @override
  void initState() {
    super.initState();
    router.addListener(onPageChange);
  }

  @override
  void dispose() {
    super.dispose();
    router.removeListener(onPageChange);
  }

  void onPageChange() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      currentPath.value = router.urlState.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          currentPath.watch(
            (context, currentPage) => NavigationRail(
              onDestinationSelected: (value) {
                if (value == 0) {
                  router.replace(const TicketRoute());
                  return;
                }

                if (value == 1) {
                  router.replace(const VehicleRoute());
                  return;
                }

                if (value == 2) {
                  router.replace(const AssignmentRoute());
                  return;
                }

                if (value == 3) {
                  router.replace(const FuelRoute());
                  return;
                }

                if (value == 4) {
                  router.replace(const UserRoute());
                  return;
                }
              },
              labelType: NavigationRailLabelType.all,
              leading: Column(
                children: [
                  vgap(20),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 40,
                  ),
                  vgap(20),
                ],
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(),
                  IconButton(
                    onPressed: () => authController.signOut(
                      onSuccess: () => router.pushAndPopUntil(SignInRoute(), predicate: (route) => false),
                    ),
                    icon: const Icon(Icons.logout_outlined),
                  ),
                ],
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.list_outlined),
                  selectedIcon: Icon(Icons.list),
                  label: Text("Tickets"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.car_rental_outlined),
                  selectedIcon: Icon(Icons.car_rental),
                  label: Text("Vehículos"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.assignment_outlined),
                  selectedIcon: Icon(Icons.assignment),
                  label: Text("Asignaciones"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_gas_station_outlined),
                  selectedIcon: Icon(Icons.local_gas_station),
                  label: Text("Combustibles"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.group_outlined),
                  selectedIcon: Icon(Icons.group),
                  label: Text("Usuarios"),
                ),
              ],
              selectedIndex: () {
                if (currentPage.contains("ticket")) {
                  return 0;
                }

                if (currentPage.contains("vehicle")) {
                  return 1;
                }
                if (currentPage.contains("assignment")) {
                  return 2;
                }

                if (currentPage.contains("fuel")) {
                  return 3;
                }

                if (currentPage.contains("user")) {
                  return 4;
                }

                return 0;
              }(),
            ),
          ),
          const VerticalDivider(width: 3),
          const Expanded(
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}
