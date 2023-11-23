// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fuel_management/core/get_it.dart' as _i9;
import 'package:fuel_management/core/router.dart' as _i3;
import 'package:fuel_management/features/auth/controllers/auth_controller.dart'
    as _i8;
import 'package:fuel_management/features/ticket/repositories/printer_repository.dart'
    as _i5;
import 'package:fuel_management/features/vehicle/controllers/vehicle_controller.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:postgrest/postgrest.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.singleton<_i4.PostgrestClient>(registerModule.client);
    gh.lazySingleton<_i5.PrinterRepository>(() => _i5.PrinterRepository());
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i7.VehicleController>(
        () => _i7.VehicleController(gh<_i4.PostgrestClient>()));
    gh.singleton<_i8.AuthController>(
        _i8.AuthController(gh<_i4.PostgrestClient>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
