import 'package:flutter/material.dart';
import 'package:recordatorios_app/screen/Home.dart';
import 'package:recordatorios_app/screen/login.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _MyRegisterFormState();
}
class _MyRegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Formulario de registro'),
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
                labelText: 'Email',
                hintText: 'Ingresa tu correo',
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
                labelText: 'Contraseña',
              ),
              obscureText: true, // Para ocultar la contraseña
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                   ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLogin()),
            );
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Ya tengo cuenta'),
              ),
            const SizedBox(height: 20.0,width: 20.0,),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
                } 
              },
              icon: const Icon(Icons.subdirectory_arrow_right_outlined),
              label: const Text('Crear cuenta'),
            ),
              ],
            )
          ],
        ),
      ),
    
      );
  }
}