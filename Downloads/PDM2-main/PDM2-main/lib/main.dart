import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pdm2/pages/login.page.dart';
import 'package:pdm2/routes.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('auth');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'If Carona',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouterGenerator.homePage,
      onGenerateRoute: RouterGenerator.generateRoute,
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
