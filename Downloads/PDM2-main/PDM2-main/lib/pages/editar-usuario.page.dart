import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({super.key});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  @override
  Widget build(BuildContext context) {
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
              'editar usuário',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(169, 131, 69, 1)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white), //<-- SEE HERE
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
                          hintText: "nome:",
                          fillColor: Colors.white),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white), //<-- SEE HERE
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
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white), //<-- SEE HERE
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(169, 131, 69, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          hintText: "senha:",
                          fillColor: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/usuarios'),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromRGBO(169, 131, 69, 1),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              'excluir',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/usuarios'),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromRGBO(169, 131, 69, 1),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              'salvar',
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
