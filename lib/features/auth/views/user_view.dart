import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:postgrest/postgrest.dart';

import '../../../core/constants.dart';
import '../../../core/entities/user_entity.dart';
import '../../../core/entities/user_rol_entity.dart';
import '../../../core/extension.dart';
import '../../../core/services.dart';

@RoutePage()
class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  PagedDataTableController<String, String, UserEntity>? _pagedController;

  @override
  void initState() {
    super.initState();
    _pagedController = PagedDataTableController<String, String, UserEntity>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Usuarios"),
        centerTitle: false,
        actions: [
          FilledButton.icon(
            onPressed: () => _pagedController?.refresh(),
            label: const Text("Recargar"),
            icon: const Icon(Icons.refresh),
            style: FilledButton.styleFrom(
              backgroundColor: MaterialStateColor.resolveWith(
                (_) => context.colorScheme.secondary,
              ),
            ),
          ),
          hgap(10),
          Builder(
            builder: (context) => FilledButton.icon(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              label: const Text("Agregar Usuario"),
              icon: const Icon(Icons.person_add),
            ),
          ),
          hgap(10),
        ],
      ),
      endDrawer: Drawer(
        child: UserForm(
          onUserCreated: () => _pagedController?.refresh(),
        ),
      ),
      body: Builder(builder: (context) {
        return PagedDataTable<String, String, UserEntity>(
          controller: _pagedController,
          theme: PagedDataTableThemeData(
            rowsTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
            headerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
            footerTextStyle: context.textTheme.bodyMedium ?? const TextStyle(),
          ),
          fetchPage: (pageToken, pageSize, sortBy, filtering) async {
            try {
              final builder = database
                  .from(UserEntity.tableName)
                  .select<PostgrestListResponse>(UserEntity.select, const FetchOptions(count: CountOption.exact))
                  .eq("admin", false);

              if (pageToken.isNotEmpty) {
                builder.lt(UserEntity.primaryKey, pageToken);
              }

              if (filtering.has("userName")) {
                builder.ilike("name", filtering.valueOrNull("userName"));
              }

              if (filtering.has("userEmail")) {
                builder.ilike("email", filtering.valueOrNull("userEmail"));
              }

              if (filtering.has("userRol")) {
                builder.eq("rol_id", filtering.valueOrNull("userRol").id);
              }

              final PostgrestResponse(:count, :data) = await builder.limit(pageSize).order(UserEntity.primaryKey);

              final vehicles = data?.map((e) => UserEntity.fromJson(e)).toList() ?? [];
              final nextPage = vehicles.length < pageSize ? null : vehicles.last.id;

              return PaginationResult.items(elements: vehicles, size: count, nextPageToken: nextPage);
            } on PostgrestException catch (error) {
              return PaginationResult.error(error: error.message);
            }
          },
          initialPage: "",
          idGetter: (item) => item.id,
          filters: [
            TextTableFilter(
              id: "userName",
              title: "Nombre",
              chipFormatter: (text) => "Nombre: $text",
            ),
            TextTableFilter(
              id: "userEmail",
              title: "Email",
              chipFormatter: (text) => "Email: $text",
            ),
            DropdownTableFilter<UserRolEntity>(
              id: "userRol",
              title: "Rol",
              chipFormatter: (rol) => "Rol: ${rol.name}",
              items: [
                const DropdownMenuItem(
                  value: UserRolEntity(id: "62979ebf-7aa0-45ff-8daa-e20e0c4c21c7", name: "Vendedor"),
                  child: Text("Vendedor"),
                ),
                const DropdownMenuItem(
                  value: UserRolEntity(id: "759aa591-3920-4a12-8ea7-6e150adebc78", name: "Supervisor"),
                  child: Text("Supervisor"),
                ),
                const DropdownMenuItem(
                  value: UserRolEntity(id: "f5b971c9-b4d0-497f-876e-3377b96e8021", name: "Administrador"),
                  child: Text("Administrador"),
                ),
              ],
            ),
          ],
          columns: [
            TextTableColumn(
              sizeFactor: null,
              getter: (item) => item.name,
              setter: (item, newValue, rowIndex) => database
                  .from(UserEntity.tableName)
                  .update({"name": newValue})
                  .eq(UserEntity.primaryKey, item.id)
                  .then((value) => true)
                  .onError((error, stackTrace) => false),
              title: "Nombre",
            ),
            TextTableColumn(
              sizeFactor: null,
              getter: (item) => item.email,
              setter: (item, newValue, rowIndex) => database
                  .from(UserEntity.tableName)
                  .update({"email": newValue})
                  .eq(UserEntity.primaryKey, item.id)
                  .then((value) => true)
                  .onError((error, stackTrace) => false),
              title: "Correo/Usuario",
            ),
            TextTableColumn(
              title: 'Contraseña',
              getter: (user) => '***',
              setter: (item, newValue, rowIndex) => database
                  .from(UserEntity.tableName)
                  .update({"password": newValue})
                  .eq(UserEntity.primaryKey, item.id)
                  .then((value) => true)
                  .onError((error, stackTrace) => false),
              sizeFactor: null,
            ),
            DropdownTableColumn(
              title: 'Rol',
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.transparent,
              ),
              getter: (item) => item.rol.id,
              setter: (item, newValue, rowIndex) => database
                  .from(UserEntity.tableName)
                  .update({"rol_id": newValue})
                  .eq(UserEntity.primaryKey, item.id)
                  .then((value) => true)
                  .onError((error, stackTrace) => false),
              items: [
                const DropdownMenuItem(value: "62979ebf-7aa0-45ff-8daa-e20e0c4c21c7", child: Text("Vendedor")),
                const DropdownMenuItem(value: "759aa591-3920-4a12-8ea7-6e150adebc78", child: Text("Supervisor")),
                const DropdownMenuItem(value: "f5b971c9-b4d0-497f-876e-3377b96e8021", child: Text("Administrador")),
              ],
            ),
            DropdownTableColumn(
              title: 'Estado',
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.transparent,
              ),
              getter: (item) => item.active,
              setter: (item, newValue, rowIndex) => database
                  .from(UserEntity.tableName)
                  .update({"active": newValue})
                  .eq(UserEntity.primaryKey, item.id)
                  .then((value) => true)
                  .onError((error, stackTrace) => false),
              items: [
                const DropdownMenuItem(value: true, child: Text("Activo")),
                const DropdownMenuItem(value: false, child: Text("Inactivo")),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class UserForm extends StatelessWidget {
  UserForm({super.key, required this.onUserCreated});

  final VoidCallback onUserCreated;

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmit(BuildContext context) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    final name = _formKey.currentState?.value["name"];
    final email = _formKey.currentState?.value["email"];
    final password = _formKey.currentState?.value["password"];
    final rol = _formKey.currentState?.value["rol"];

    await database
        .from(UserEntity.tableName)
        .insert({
          "name": name,
          "email": email,
          "password": password,
          "rol_id": rol,
        })
        .then((_) => onUserCreated())
        .then((_) => Navigator.of(context).pop())
        .onError(
          (error, stackTrace) => context.scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: p12,
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(label: Text("Nombre")),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            vgap(10),
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(label: Text("Correo/Usuario")),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                // FormBuilderValidators.email(),
              ]),
            ),
            vgap(10),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(label: Text("Contraseña")),
              validator: FormBuilderValidators.required(),
            ),
            vgap(10),
            FormBuilderDropdown(
              name: 'rol',
              decoration: const InputDecoration(label: Text("Rol")),
              validator: FormBuilderValidators.required(),
              items: const [
                DropdownMenuItem(value: "62979ebf-7aa0-45ff-8daa-e20e0c4c21c7", child: Text("Vendedor")),
                DropdownMenuItem(value: "759aa591-3920-4a12-8ea7-6e150adebc78", child: Text("Supervisor")),
                DropdownMenuItem(value: "f5b971c9-b4d0-497f-876e-3377b96e8021", child: Text("Administrador")),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Agregar vehículo"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => onSubmit(context),
                child: const Text("Agregar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
