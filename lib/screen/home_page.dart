import 'package:flutter/material.dart';
import '../screen/categorias.dart';
import '../screen/maestros.dart';

class Recordatorio {
  final String titulo;
  final String contenido;
  final DateTime fechaHora;

  Recordatorio(this.titulo, this.contenido, this.fechaHora);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Recordatorio> _recordatorios = [];

  void _agregarRecordatorio(String titulo, String contenido) {
    setState(() {
      _recordatorios.add(Recordatorio(titulo, contenido, DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de tareas'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _recordatorios.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_recordatorios[index].titulo),
            subtitle: Text(_recordatorios[index].fechaHora.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {
                _mostrarDetalleRecordatorio(
                    context,
                    _recordatorios[index].titulo,
                    _recordatorios[index].contenido,
                    _recordatorios[index].fechaHora.toString());
              },
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 107, 232),
              ),
              child: Text('Gestor de tareas'),
            ),
            ListTile(
              title: const Text('Categorías'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Categorias()),
                );
              },
            ),
            ListTile(
              title: const Text('Maestros'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Maestros()),
                );
              },
            ),
          ],
        ),
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
    TextEditingController tituloController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();
    TextEditingController FechayHora = TextEditingController();
    TextEditingController catergoriaController = TextEditingController();
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
                controller: tituloController,
                decoration: const InputDecoration(hintText: 'Título'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: FechayHora,
                decoration: const InputDecoration(hintText: 'Fecha y hora'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descripcionController,
                decoration: const InputDecoration(hintText: 'Descripción'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: catergoriaController,
                decoration: const InputDecoration(hintText: 'Categoria'),
              ),
              const SizedBox(height: 20),
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
                if (tituloController.text.isNotEmpty &&
                    descripcionController.text.isNotEmpty) {
                  _agregarRecordatorio(
                      tituloController.text, descripcionController.text);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, completa todos los campos.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetalleRecordatorio(
      BuildContext context, String titulo, String contenido, String fechaHora) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido: $contenido'),
              const SizedBox(height: 10),
              Text('Fecha y hora: $fechaHora'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
