import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Text('''Este proyecto utiliza el patrón Model-View-ViewModel, el estándar recomendado para Flutter:

Model: Estructuras de datos puras que representan la información de las películas (Entities).
View: Vistas declarativas de Flutter que observan cambios en el estado del ViewModel.
ViewModel: La capa lógica que gestiona las peticiones de red, el procesamiento de datos y expone el estado a la vista.
Service: Capa logica para obtencion de datos desde la api desde (https://api.themoviedb.org).'''),
      ),
    );
  }
}