import 'package:flutter/material.dart';

class Maestros extends StatelessWidget {
  const Maestros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maestros'),
      ),
      body: const Center(
        child: Text('maestros'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregarRecordatorio(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  void _mostrarDialogoAgregarRecordatorio(BuildContext context) async {
    TextEditingController maestroController = TextEditingController();

    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Recordatorio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: maestroController,
                decoration: const InputDecoration(hintText: 'Maestro'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}
