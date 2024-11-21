import 'package:flutter/material.dart';
import 'network_scanner.dart';

void main() {
  runApp(NetworkMonitorApp());
}

class NetworkMonitorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Monitor',
      home: NetworkMonitorScreen(),
    );
  }
}

class NetworkMonitorScreen extends StatefulWidget {
  @override
  _NetworkMonitorScreenState createState() => _NetworkMonitorScreenState();
}

class _NetworkMonitorScreenState extends State<NetworkMonitorScreen> {
  final NetworkScanner _networkScanner = NetworkScanner();
  List<String> _devices = [];
  bool _isScanning = false;

  Future<void> _scanNetwork() async {
    setState(() {
      _isScanning = true;
      _devices = [];
    });

    final devices = await _networkScanner.scanDevices();
    setState(() {
      _devices = devices;
      _isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Monitor'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _isScanning ? null : _scanNetwork,
            child: _isScanning ? Text('Scanning...') : Text('Scan Network'),
          ),
          Expanded(
            child: _devices.isEmpty
                ? Center(child: Text('No devices found'))
                : ListView.builder(
                    itemCount: _devices.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_devices[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
