import 'package:flutter/material.dart';
import 'package:pdm2/blocs/usuario.bloc.dart';
import 'package:pdm2/routes.dart';

import '../models/usuario.model.dart';

class Editar extends StatefulWidget {
  final String id;
  const Editar({super.key, required this.id});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  UsuarioBloc usuarioBloc = UsuarioBloc();
  TextEditingController nomeController = TextEditingController();
  TextEditingController raController = TextEditingController();
  late Future<Usuario?> usuario;
  @override
  Widget build(BuildContext context) {
    setState(() {
      usuario = usuarioBloc.getUser(widget.id);
    });
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
              'Dados do usuário',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(169, 131, 69, 1)),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                  child: FutureBuilder<Usuario?>(
                    future: usuario,
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      nomeController.text = snapshot.data!.nome;
                      raController.text = snapshot.data!.ra;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          TextField(
                            controller: nomeController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                  color: Color.fromRGBO(169, 131, 69, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                hintText: "Nome:",
                                fillColor: Colors.white),
                          ),
                          TextField(
                            controller: raController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: const TextStyle(
                                    color: Color.fromRGBO(169, 131, 69, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                hintText: "RA:",
                                fillColor: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    mostrarModalDeExclusao(context),
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      const Color.fromRGBO(169, 131, 69, 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Text(
                                    'Apagar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _atualizaUsuario,
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      const Color.fromRGBO(169, 131, 69, 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Text(
                                    'Atualizar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  mostrarModalDeExclusao(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(169, 131, 69, 1),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Cancelar"),
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(169, 131, 69, 1),
      ),
      onPressed: () {
        _excluirUsuario(context);
      },
      child: const Text("Excluir"),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Atenção"),
      content: const Text("Deseja realmente excluir este usuário?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _atualizaUsuario() {
    usuarioBloc.atualizarUser(
        widget.id, {'nome': nomeController.text, 'RA': raController.text}, () {
      setState(() {
        usuario = usuarioBloc.getUser(widget.id);
      });
      _exibirToast(context, 'Usuário atualizado com sucesso!');
    });
  }

  void _excluirUsuario(BuildContext context) {
    Navigator.pop(context);
    usuarioBloc.excluirUsuario(widget.id, () {
      _exibirToast(context, "Usuário excluído com sucesso");
      Navigator.of(context).pushNamed(RouterGenerator.listagemUsuarioPage);
    });
  }

  void _exibirToast(BuildContext context, String mensagem) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(mensagem),
    ));
  }
}
