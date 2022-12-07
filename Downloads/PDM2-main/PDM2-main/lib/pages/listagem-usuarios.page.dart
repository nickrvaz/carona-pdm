import 'package:flutter/material.dart';
import 'package:pdm2/blocs/usuario.bloc.dart';
import 'package:pdm2/pages/editar-usuario.page.dart';
import 'package:pdm2/routes.dart';
import '../models/usuario.model.dart';

class ListagemUsuarios extends StatefulWidget {
  const ListagemUsuarios({super.key});

  @override
  State<ListagemUsuarios> createState() => _ListagemUsuariosState();
}

class _ListagemUsuariosState extends State<ListagemUsuarios> {
  UsuarioBloc usuarioBloc = UsuarioBloc();
  late Future<List<Usuario>> usuarios;
  @override
  Widget build(BuildContext context) {
    usuarios = usuarioBloc.getUsers();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 241, 220, 1),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(169, 131, 69, 1),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Carona Estudantil',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 65,
                  color: Color.fromRGBO(169, 131, 69, 1)),
            ),
            const Text(
              'usuários',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(169, 131, 69, 1)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: FutureBuilder<List<Usuario>>(
                  future: usuarios,
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : ListView(
                            children: List.generate(
                              snapshot.data!.length,
                              (index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  height: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RA: ${snapshot.data![index].ra}",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(169, 131, 69, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Nome: ${snapshot.data![index].nome}",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(169, 131, 69, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Center(
                                          child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xffa68244)),
                                            ),
                                            onPressed: () => _editarUsuario(
                                                context, snapshot.data![index]),
                                            child: const Text(
                                              "Editar",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editarUsuario(context, Usuario? usuario) {
    Navigator.of(context)
        .pushNamed(RouterGenerator.editarUsuarioPage, arguments: {
      'id': usuario!.id
    }).then((_) => setState(() {
              usuarios = usuarioBloc.getUsers();
            }));
  }
}
