import 'package:flutter/material.dart';
import 'news_widget.dart'; 
import 'cambio_monedas.dart';
import 'task_list.dart';
import 'podcast_widget.dart';

main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App CEUTEC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 159, 170, 163),
              ),
              child: Text(
                'Mi Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text('Noticias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsWidget()),
                ); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance),
              title: const Text('Cambio de Monedas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CurrencyExchangeWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_task),
              title: const Text('Lista de Tareas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskListWidget()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.podcasts),
              title: const Text('Podcast'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PodcastWidget()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://universiwebb.com/wp-content/uploads/nombre_color.jpg'), 
            fit: BoxFit.contain, 
          ),
        ),
        child: const Center(
          child: Text(
            'Pantalla Principal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
