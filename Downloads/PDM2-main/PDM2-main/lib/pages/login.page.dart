import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              'login',
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/admin'),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromRGBO(169, 131, 69, 1),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              'entrar',
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
