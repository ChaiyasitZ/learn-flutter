import 'package:ssh2/ssh2.dart';

class CiscoController {
  final String host;
  final int port;
  final String username;
  final String password;

  CiscoController({
    required this.host,
    this.port = 22, // Default SSH port
    required this.username,
    required this.password,
  });

  Future<String> runCommand(String command) async {
    try {
      SSHClient client = SSHClient(
        host: host,
        port: port,
        username: username,
        passwordOrKey: password,
      );

      await client.connect();
      final result = await client.execute(command);
      await client.disconnect();
      return result ?? 'No response';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
