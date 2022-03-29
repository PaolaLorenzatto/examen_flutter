import 'package:flutter/material.dart';
import 'dart:math';

class NombreApellidoWidget extends StatefulWidget {
  const NombreApellidoWidget({Key? key}) : super(key: key);

  @override
  State<NombreApellidoWidget> createState() => _NombreApellidoWidgetState();
}

class _NombreApellidoWidgetState extends State<NombreApellidoWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _nombre = '';
  String _apellido = '';
  String _randomList = '';
  bool _showLetter = false;

  void ingresarNombreyApellido() {
    String _abc = 'ABCDEFGHIJKLMÑOPQRSTUVWZ';
    _randomList = '';
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey.currentState!.reset();
      String _fullString =
          '${_nombre.toUpperCase()} ${_apellido.toUpperCase()}';

      List<String> _lettersList = _fullString.split('');
      List<String> _abcList = _abc.split('');
      int masDeTres = 0;

      for (String char in _abcList) {
        if (_fullString.contains(char)) {
          masDeTres++;
        }
      }

      if (masDeTres > 2) {
        for (var i = 0; i < 3;) {
          String newRandomLetter = _abc[Random().nextInt(_abc.length)];
          if (!_randomList.contains(newRandomLetter) &&
              _lettersList.contains(newRandomLetter)) {
            _randomList = ' ' + _randomList + newRandomLetter + ' ';
            i++;
          }
        }
        _randomList.trim();
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: _randomList.isEmpty
              ? const Text(
                  'El nombre y apellido ingresado deben contener más de tres letras distintas, intente nuevamente.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    ..._lettersList
                        .map(
                          (e) => TextSpan(
                            text: e,
                            style: TextStyle(
                                fontSize: 20,
                                color: _randomList.contains(e)
                                    ? Colors.red
                                    : Colors.black),
                          ),
                        )
                        .toList()
                  ]),
                ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showLetter = true;
                });

                Navigator.of(context).pop();
              },
              child: Text(
                'Aceptar',
                /* style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary), */
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Por favor ingrese su nombre' : null,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    label: Text(
                      'Ingrese su nombre',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onSaved: (value) {
                    setState(() {
                      _nombre = value.toString();
                    });
                  },
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  validator: (value) =>
                      value!.isEmpty ? 'Por favor ingrese su apellido' : null,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    label: Text(
                      'Ingrese su apellido',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onSaved: (value) {
                    setState(() {
                      _apellido = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: ingresarNombreyApellido,
                      icon: const Icon(Icons.done),
                      label: const Text('Aceptar'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (_randomList.isNotEmpty && _showLetter)
                      Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 25,
                            ),
                            child: Text(
                              _randomList,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
