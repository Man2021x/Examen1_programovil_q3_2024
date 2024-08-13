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
                  'https://previews.123rf.com/images/rastudio/rastudio1708/rastudio170809958/84944028-icono-de-l%C3%ADnea-de-vector-de-noticias-global-aislado-sobre-fondo-blanco-icono-de-l%C3%ADnea-de-noticias.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const ListTile(
                  title: Text('Título de la noticia 1'),
                  subtitle: Text('Breve descripción de la noticia 1.'),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://img.freepik.com/fotos-premium/objetos-blanco_932052-118.jpg?size=626&ext=jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const ListTile(
                  title: Text('Título de la noticia 2'),
                  subtitle: Text('Breve descripción de la noticia 2.'),
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