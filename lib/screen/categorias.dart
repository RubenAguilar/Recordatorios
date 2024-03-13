import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recordatorios_app/services/category_service.dart';


class Categorias extends StatelessWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),

     body: FutureBuilder<List>(
        future: getCategory(), // Llama al método para obtener las categorías
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las categorías'));
          } else {
            List categorias = snapshot.data ?? [];
            return DataTableExample(categorias: categorias);
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _agregarCategoria(context);
        },
        child: const Icon(Icons.add),
    )
    );
  }
}


class DataTableExample extends StatefulWidget {
  final List categorias;
  const DataTableExample({Key? key, required this.categorias}) : super(key: key);

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
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
              'Eliminar',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
        rows: widget.categorias.map((categoria) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(categoria['name'] ?? '')),
            //DataCell(Text(categoria['fecha'] ?? '')),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Lógica para eliminar la categoría
              },
            )),
          ],
        );
      }).toList(),
      
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

