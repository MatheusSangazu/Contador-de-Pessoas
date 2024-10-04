import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contagem = 0;

  void decrement() {
    setState(() {
      contagem--;
    });
  }

  void increment() {
    setState(() {
      contagem++;
    });
  }

  bool get EstaVazio => contagem == 0;
  bool get EstaCheio => contagem == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,   
              Colors.purple  
            ],
          ),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(EstaCheio ? 'Seu Estabelecimento está lotado!' : 'Ainda Restam Vagas',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700, 
                  ), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '$contagem',
                  style: TextStyle(
                      color: EstaCheio ? Colors.red : Colors.white,
                      fontSize: 100),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: EstaVazio ? null : decrement,
                    style: TextButton.styleFrom(
                      backgroundColor:
                          EstaVazio ? Colors.white70 : Colors.white,
                      fixedSize: const Size(100, 100),
                      overlayColor: Colors.red, // cor ao clicar no botão
                    ),
                    child: const Text('Saiu',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: EstaCheio ? null : increment,
                    style: TextButton.styleFrom(
                      backgroundColor:
                          EstaCheio ? Colors.white70 : Colors.white,
                      fixedSize: const Size(100, 100),
                      overlayColor: const Color.fromARGB(255, 50, 234, 56),
                    ),
                    child: const Text('Entrou',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
