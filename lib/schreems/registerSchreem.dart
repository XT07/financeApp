import 'package:flutter/material.dart';
import '../config/database/database.dart';

class registerSchreem extends StatefulWidget {
  @override
  _registerSchreemState createState() => _registerSchreemState();
}

class _registerSchreemState extends State<registerSchreem> {
  String _mensage = '';
  final _controllerCategorie = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerValue = TextEditingController();

  Future<void> _save() async {
    final value = double.tryParse(_controllerValue.text);

    if (value == null) {
      setState(() {
        _mensage = 'Insira um valor válido para registro.';
      });
      return;
    }

    await DatabaseHelper.save(
      _controllerCategorie.text,
      _controllerDescription.text,
      value,
    );

    _controllerCategorie.clear();
    _controllerDescription.clear();
    _controllerValue.clear();

    setState(() {
      _mensage = 'Valor registrado.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar gastos')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_mensage, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            TextField(
              controller: _controllerCategorie,
              decoration: InputDecoration(
                labelText: 'Categoria',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controllerDescription,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controllerValue,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                child: Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}