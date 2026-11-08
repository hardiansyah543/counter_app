import 'package:flutter/material.dart';
import 'widgets/counter_display.dart';
import 'widgets/counter_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('Counter dimulai');
  }

  @override
  void dispose() {
    print('Counter ditutup');
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    // Angka tidak boleh minus
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(count: _counter),
            const SizedBox(height: 32),
            CounterButtons(
              onAdd: _increment,
              onSubtract: _decrement,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}
