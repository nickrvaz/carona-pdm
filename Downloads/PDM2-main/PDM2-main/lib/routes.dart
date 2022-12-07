import 'package:flutter/material.dart';
import 'package:pdm2/pages/admin.page.dart';
import 'package:pdm2/pages/cadastro-usuario.page.dart';
import 'package:pdm2/pages/editar-usuario.page.dart';
import 'package:pdm2/pages/listagem-usuarios.page.dart';
import 'package:pdm2/pages/login.page.dart';
import 'package:pdm2/pages/usuarios.page.dart';

class RouterGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String usuarioPage = '/usuario';
  static const String adminPage = '/admin';
  static const String editarUsuarioPage = '/editar-usuario';
  static const String cadastrarUsuarioPage = '/cadastrar-usuario';
  static const String listagemUsuarioPage = '/listagem-usuario';

  RouterGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case usuarioPage:
        return MaterialPageRoute(
          builder: (_) => const Usuarios(),
        );
      case adminPage:
        return MaterialPageRoute(
          builder: (_) => const AdminPage(),
        );
      case editarUsuarioPage:
        return MaterialPageRoute(builder: (context) {
          String id = (settings.arguments as Map)['id'];
          return Editar(id: id);
        });
      case cadastrarUsuarioPage:
        return MaterialPageRoute(
          builder: (_) => const CadastroUsuario(),
        );
      case listagemUsuarioPage:
        return MaterialPageRoute(
          builder: (_) => const ListagemUsuarios(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
