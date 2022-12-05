import 'package:flutter/material.dart';
import 'package:pdm2/pages/admin.page.dart';
import 'package:pdm2/pages/cadastro-usuario.page.dart';
import 'package:pdm2/pages/editar-usuario.page.dart';
import 'package:pdm2/pages/login.page.dart';
import 'package:pdm2/pages/listagem-usuarios.page.dart';
import 'package:pdm2/pages/usuarios.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/login': (context) => LoginPage(),
        '/editar-usuario': (context) => Editar(),
        '/cadastro-usuario': (context) => CadastroUsuario(),
        '/listagem-usuarios': (context) => ListagemUsuarios(),
        '/usuarios': (context) => Usuarios(),
        '/admin': (context) => AdminPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 241, 220, 1),
      body: LoginPage(),
    );
  }
}
