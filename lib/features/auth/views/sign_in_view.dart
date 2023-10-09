import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/constants.dart';
import '../../../core/extension.dart';
import '../../../core/router.dart';
import '../../../core/services.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final _obscureText = ValueNotifier(false);

  Future<void> _doSignIn(BuildContext context) async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    return authController.signInWithEmailAndPassword(
      email: _formKey.currentState?.value["username"] ?? "",
      password: _formKey.currentState?.value["password"] ?? "",
      onFailure: (message) {
        context.scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(message ?? ""),
          behavior: SnackBarBehavior.floating,
        ));
      },
      onSuccess: () {
        router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: context.appSize.height * 0.8,
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: p4,
                  child: Image.asset("assets/images/logo_small.png"),
                ),
                vgap(40),
                FormBuilderTextField(
                  name: 'username',
                  decoration: const InputDecoration(label: Text("Usuario")),
                  validator: FormBuilderValidators.required(),
                  onSubmitted: (_) => _doSignIn(context),
                ),
                vgap(10),
                _obscureText.watch(
                  (context, state) => FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      label: const Text("Contraseña"),
                      suffixIcon: IconButton(
                        onPressed: () => _obscureText.value = !state,
                        icon: Icon(state ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    obscureText: !state,
                    validator: FormBuilderValidators.required(),
                    onSubmitted: (_) => _doSignIn(context),
                  ),
                ),
                vgap(20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => _doSignIn(context),
                    child: const Text("Iniciar Sesión"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
