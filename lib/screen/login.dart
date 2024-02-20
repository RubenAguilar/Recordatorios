import 'package:flutter/material.dart';
import 'package:recordatorios_app/screen/Home.dart';
import 'package:recordatorios_app/screen/registerForm.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}
class _MyLoginState extends State<MyLogin> {
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Inicio de sesión'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debes de ingresar un correo';
              }
              return null;
            },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingresa tu Email',
                hintText: 'Crea tu correo',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debes de ingresar una contraseña';
              }
              return null;
            },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingresa tu Contraseña',
                hintText: 'Crea una contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                   ElevatedButton.icon(
                onPressed: () {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterForm()),
            );
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Crear cuenta'),
              ),
              const SizedBox(height: 20.0,width: 20.0,),
            ElevatedButton.icon(
              onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Procesando información')),
                  );
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
                } 
              },
              icon: const Icon(Icons.subdirectory_arrow_right_outlined),
              label: const Text('Iniciar sesion'),
            ),
              ],
            )
          ],
        ),
      ),
    
      );
  }
}