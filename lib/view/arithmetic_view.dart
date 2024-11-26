import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  double? first;
  double? second;
  String result = '';

  // Function to safely parse the input and handle errors
  void _parseInput(String value, bool isFirst) {
    setState(() {
      try {
        if (isFirst) {
          first = double.parse(value);
        } else {
          second = double.parse(value);
        }
      } catch (e) {
        result = 'Invalid input';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _parseInput(value, true),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter First Number',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) => _parseInput(value, false),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Second Number',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (first != null && second != null) {
                    setState(() {
                      result = (first! + second!).toString();
                    });
                  }
                },
                child: const Text('Addition'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (first != null && second != null) {
                    setState(() {
                      result = (first! - second!).toString();
                    });
                  }
                },
                child: const Text('Subtraction'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (first != null && second != null) {
                    setState(() {
                      result = (first! * second!).toString();
                    });
                  }
                },
                child: const Text('Multiplication'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (first != null && second != null) {
                    if (second != 0) {
                      setState(() {
                        result = (first! / second!).toStringAsFixed(2);
                      });
                    } else {
                      setState(() {
                        result = 'Cannot divide by zero';
                      });
                    }
                  }
                },
                child: const Text('Division'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
