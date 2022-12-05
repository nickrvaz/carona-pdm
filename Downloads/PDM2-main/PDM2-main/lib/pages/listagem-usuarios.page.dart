import 'package:flutter/material.dart';
import '../models/usuario.model.dart';

class ListagemUsuarios extends StatelessWidget {
  const ListagemUsuarios({super.key});
  @override
  Widget build(BuildContext context) {
    List<Usuario> usuarios = [
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
      Usuario("a", "b", "c"),
    ];
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

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
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // <= No more error here :)
                        color: Colors.white,
                      ),
                      height: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RA: ${usuarios[index].ra}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(169, 131, 69, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "nome: ${usuarios[index].nome}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(169, 131, 69, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xffa68244)),
                                ),
                                onPressed: () => Navigator.pushNamed(context, '/editar-usuario'),
                                child: const Text(
                                  "editar",
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
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
