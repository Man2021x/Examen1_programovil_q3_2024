import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://paradigma.hn/wp-content/uploads/2021/05/UNAH-CU-1.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const ListTile(
                  title: Text('¿Cuánto se paga en la Universidad de Honduras?'),
                  subtitle: Text('Según el plan de arbitrios vigente de la UNAH los costos por matrícula corresponden de la siguiente manera: Estudiantes de primer ingreso L 410.00 lempiras (incluyendo el pago de los 60 lempiras por el “Curso Introducción a la Vida Universitaria”).'),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://ceutec.hn/wp-content/uploads/2024/06/celebramos-con-orgullo-la-graduacion-de-357-nuevos-profesionales.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const ListTile(
                  title: Text('¡Celebramos con orgullo la graduación de 357 nuevos profesionales!'),
                  subtitle: Text('Celebramos la graduación de 357 nuevos profesionales, incluyendo el primer grupo de Licenciatura en Terapia Física y Ocupacional.'),
                ),
              ],
            ),
          ),
          // Más tarjetas de noticias...

          // Botón para regresar al menú principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresa al menú principal
              },
              child: const Text('Regresar al menú principal'),
            ),
          ),
        ],
      ),
    );
  }
}