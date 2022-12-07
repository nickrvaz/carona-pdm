import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:pdm2/models/usuario.model.dart';

import '../utils/request.dart';

class UsuarioBloc {
  Future<List<Usuario>> getUsers() async {
    var box = Hive.box('auth');
    final response = await Requester.doGetRequest(
        'http://4.204.221.228:3000/admin/user',
        {'authorization': box.get('token')});
    var apiReturn = jsonDecode(response.body);
    List<Usuario> users = [];
    for (var element in apiReturn['rows']) {
      users.add(Usuario.fromJson(element));
    }
    return users;
  }

  Future<Usuario> getUser(String id) async {
    var box = Hive.box('auth');
    final response = await Requester.doGetRequest(
        'http://4.204.221.228:3000/user/$id',
        {'authorization': box.get('token')});
    var user = Usuario.fromJson(jsonDecode(response.body));

    return user;
  }

  atualizarUser(String id, Object body, Function callback) async {
    var box = Hive.box('auth');
    await Requester.doPutRequest('http://4.204.221.228:3000/admin/user/$id',
        body, {'authorization': box.get('token')});
    callback();
  }

  excluirUsuario(String id, Function callback) async {
    var box = Hive.box('auth');
    await Requester.doDeleteRequest('http://4.204.221.228:3000/admin/user/$id',
        {'authorization': box.get('token')});
    callback();
  }

  criarUsuario(Object body, Function callback) async {
    var box = Hive.box('auth');
    await Requester.doPostRequest('http://4.204.221.228:3001/cadastro-usuario',
        body, {'authorization': box.get('token')});
    callback();
  }
}
