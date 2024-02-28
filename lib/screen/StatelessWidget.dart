import 'package:recordatorios_app/screen/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de tareas',
      debugShowCheckedModeBanner: false,
   
      initialRoute: AppRoutes.initialroute,
      routes: AppRoutes.routes,
    );
  }
}