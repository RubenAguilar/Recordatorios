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
              'Role',
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
            DataCell(Text('Vencido')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Cuestionario')),
            DataCell(Text('24/02')),
            DataCell(Text('No Vencido')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Tarea Gerardo')),
            DataCell(Text('27/02')),
            DataCell(Text('No Vencido')),
          ],
        ),
      ],
    );
    
  }
  
}
