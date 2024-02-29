import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
     body: const DataTableExample(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _agregarCategoria(context);
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
              'Titulo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Fecha',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Eliminar',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('String 5')),
            DataCell(Text('20/02')),
            DataCell(Icon(Icons.delete)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cuestionario')),
            DataCell(Text('24/02')),
            DataCell(Icon(Icons.delete)),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Tarea Gerardo')),
            DataCell(Text('27/02')),
            DataCell(Icon(Icons.delete)),
          ],
        ),
         DataRow(
          cells: <DataCell>[
            DataCell(Text('Tarea Responsabilidad')),
            DataCell(Text('29/02')),
            DataCell(Icon(Icons.delete)),
          ],
        ),
      ],
      
    );
    
  }
  
}
void _agregarCategoria(BuildContext context) async {
    TextEditingController categoriaController = TextEditingController();

    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Categoria'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: categoriaController,
                decoration: const InputDecoration(hintText: 'Nombre:'),
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

