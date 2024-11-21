import 'package:flutter/material.dart';
import 'cisco_command.dart';

void main() {
  runApp(CiscoApp());
}

class CiscoApp extends StatelessWidget {
  const CiscoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cisco Device Commander',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CiscoCommandScreen(),
    );
  }
}

class CiscoCommandScreen extends StatefulWidget {
  const CiscoCommandScreen({super.key});

  @override
  _CiscoCommandScreenState createState() => _CiscoCommandScreenState();
}

class _CiscoCommandScreenState extends State<CiscoCommandScreen> {
  final _ipController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _commandController = TextEditingController();

  String _output = '';
  bool _isExecuting = false;

  Future<void> _sendCommand() async {
    final ip = _ipController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final command = _commandController.text.trim();

    if (ip.isEmpty || username.isEmpty || password.isEmpty || command.isEmpty) {
      setState(() {
        _output = 'Please fill in all fields.';
      });
      return;
    }

    final CiscoController ciscoController = CiscoController(
      host: ip,
      username: username,
      password: password,
    );

    setState(() {
      _isExecuting = true;
      _output = 'Executing...';
    });

    final result = await ciscoController.runCommand(command);
    setState(() {
      _output = result;
      _isExecuting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cisco Command Interface'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ipController,
              decoration: const InputDecoration(
                labelText: 'IP Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _commandController,
              decoration: const InputDecoration(
                labelText: 'Enter Cisco Command',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isExecuting ? null : _sendCommand,
              child: Text(_isExecuting ? 'Executing...' : 'Send Command'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: const TextStyle(fontFamily: 'Courier'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
