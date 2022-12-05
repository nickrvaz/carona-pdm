import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
              'admin',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(169, 131, 69, 1)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/usuarios'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'usuários',
                        style: TextStyle(
                          color: Color.fromRGBO(169, 131, 69, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'carros',
                        style: TextStyle(
                          color: Color.fromRGBO(169, 131, 69, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'caronas',
                        style: TextStyle(
                          color: Color.fromRGBO(169, 131, 69, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
