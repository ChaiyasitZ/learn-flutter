import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM - 1999',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const ATM(),
    );
  }
}

class ATM extends StatefulWidget {
  const ATM({Key? key}) : super(key: key);

  @override
  _ATMState createState() => _ATMState();
}

class _ATMState extends State<ATM> {
  int balance = 0;
  final TextEditingController _controller = TextEditingController();
  String notification = '';
  Color notificationColor = Colors.black;

  void _deposit() {
    setState(() {
      balance += int.tryParse(_controller.text) ?? 0;
      notification = 'Deposit successful';
      notificationColor = Colors.green;
    });
  }

  void _withdraw() {
    setState(() {
      int amount = int.tryParse(_controller.text) ?? 0;
      if (balance >= amount) {
        balance -= amount;
        notification = 'Withdraw successful';
        notificationColor = Colors.green;
      } else {
        notification = 'Insufficient funds';
        notificationColor = Colors.red;
      }
    });
  }

  void _setAmount(int amount) {
    _controller.text = amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM - 1999'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Balance: $balance',
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),
              Text(
                notification,
                style: TextStyle(fontSize: 20, color: notificationColor),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select amount:',
                style: TextStyle(fontSize: 30, color: Colors.red), // Increased font size
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int amount in [1000, 2000, 3000])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                            onPressed: () => _setAmount(amount),
                            child: Text(
                              '$amount',
                              style: const TextStyle(fontSize: 20), // Set font size
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int amount in [4000, 5000, 6000])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton(
                            onPressed: () => _setAmount(amount),
                            child: Text(
                              '$amount',
                              style: const TextStyle(fontSize: 20), // Set font size
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _deposit,
                    icon: const Icon(Icons.add_circle),
                    label: const Text(
                      'Deposit',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: _withdraw,
                    icon: const Icon(Icons.remove_circle),
                    label: const Text(
                      'Withdraw',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}