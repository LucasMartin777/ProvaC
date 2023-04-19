import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController emailController = TextEditingController();

  double _currentSliderValue = 20;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentSliderValue = _currentSliderValue + 1;
              });
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 22),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentSliderValue = _currentSliderValue - 1;
              });
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Rádio SENAC',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Volume',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Modulação',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text('AM'),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = !switchValue;
                        });
                      }),
                  Text('FM'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mensagem',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Escreva aqui',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
