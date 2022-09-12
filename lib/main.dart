import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_test1/Pages/formulario_rol.dart';
import 'package:prueba_test1/Pages/perfil_user.dart';
import 'package:prueba_test1/Provider/sing_in_provider.dart';
import 'package:prueba_test1/login/code_page.dart';
import 'package:prueba_test1/login/sing_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prueba_test1/pages/skills_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SingInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'singIn',
        routes: {
          'singIn': (_) => const SingIn(),
          'codePage': (_) => const CodePage(),
          'skilsPage': (_) => const SkillsPage(),
          'formulario': (_) => const RolUserForm(),
          'perfilUser': (_) => const PerfilUser()
        },
      ),
    );
  }
}
