import 'package:flutter/material.dart';

class Maestros extends StatelessWidget {
  const Maestros({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maestros'),
      ),
     body: const DataTableExample(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _agregarMaestro(context);
        },
        child: const Icon(Icons.add),
    )
    );
  }
}


class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nombre',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Materia',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Editar',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Roberto')),
            DataCell(Text('Matematicas')),
            DataCell(Icon(Icons.edit)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Ruben')),
            DataCell(Text('Geografia')),
            DataCell(Icon(Icons.edit)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Juanito')),
            DataCell(Text('Historia')),
            DataCell(Icon(Icons.edit)),
          ],
        ),
      ],
      
    );
    
  }
  
}
void _agregarMaestro(BuildContext context) async {
    TextEditingController categoriaController = TextEditingController();

    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Maestro'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: categoriaController,
                decoration: const InputDecoration(hintText: 'Nombre:'),
              ),
              TextField(
                controller: categoriaController,
                decoration: const InputDecoration(hintText: 'Materia:'),
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

