import 'package:network_info_plus/network_info_plus.dart';
import 'dart:async';
import 'dart:io';

class NetworkScanner {
  final NetworkInfo _networkInfo = NetworkInfo();

  // Get the current device's subnet
  Future<String?> getSubnet() async {
    final ip = await _networkInfo.getWifiIP();
    if (ip == null) return null;

    // Convert IP to subnet, e.g., 192.168.1.2 -> 192.168.1
    final subnet = ip.substring(0, ip.lastIndexOf('.'));
    return subnet;
  }

  // Scan devices on the subnet
  Future<List<String>> scanDevices() async {
    final subnet = await getSubnet();
    if (subnet == null) return [];

    final List<String> activeDevices = [];
    final List<Future<void>> tasks = [];

    // Ping all IPs in the subnet range
    for (int i = 1; i < 255; i++) {
      final ip = '$subnet.$i';
      tasks.add(
        InternetAddress.lookup(ip).then((result) {
          if (result.isNotEmpty) {
            activeDevices.add(ip);
          }
        }).catchError((_) {}),
      );
    }

    await Future.wait(tasks);
    return activeDevices;
  }
}
