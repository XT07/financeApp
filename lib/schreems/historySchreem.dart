import 'package:flutter/material.dart';
import '../config/database/database.dart';

class historySchreem extends StatefulWidget {
  @override
  _historySchreemState createState() => _historySchreemState();
}

class _historySchreemState extends State<historySchreem> {
  List<Map<String, dynamic>> _expenses = [];

  Future<void> _load() async {
    final list = await DatabaseHelper.all();
    setState(() {
      _expenses = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de gastos')),
      body: _expenses.isEmpty
          ? Center(child: Text('Nada registrado'))
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return ListTile(
                  title: Text(expense['categorie']),
                  subtitle: Text(expense['description']),
                  trailing: Text(
                    'R\$ ${expense['value'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  onLongPress: () async {
                    await DatabaseHelper.delete(expense['id']);
                    _load();
                  },
                );
              },
            ),
    );
  }
}