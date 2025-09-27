import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool _switchValue = false;
  String _selectedRadio = 'A';
  bool _checkboxValue = false;
  double _sliderValue = 50;

  void _incrementCounter() => setState(() => _counter++);
  void _resetCounter() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Multi Widgets Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // قسم Counter
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Counter', style: TextStyle(fontSize: 22)),
                    Text('$_counter', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: _incrementCounter, child: const Text('Increase')),
                        const SizedBox(width: 10),
                        ElevatedButton(onPressed: _resetCounter, child: const Text('Reset')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // قسم Switch
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Enable Feature'),
                    Switch(
                      value: _switchValue,
                      onChanged: (val) => setState(() => _switchValue = val),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // قسم Radio
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Select Option'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ['A', 'B', 'C'].map((option) {
                        return Row(
                          children: [
                            Radio<String>(
                              value: option,
                              groupValue: _selectedRadio,
                              onChanged: (val) => setState(() => _selectedRadio = val!),
                            ),
                            Text(option),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // قسم Checkbox
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Accept Terms'),
                    Checkbox(
                      value: _checkboxValue,
                      onChanged: (val) => setState(() => _checkboxValue = val!),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // قسم Slider
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Adjust Value'),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _sliderValue.round().toString(),
                      onChanged: (val) => setState(() => _sliderValue = val),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // زر Snackbar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Snackbar!')),
                );
              },
              child: const Text('Show Snackbar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
