import 'package:cypher_app/model/client.dart';
import 'package:cypher_app/model/package.dart';
import 'package:flutter/widgets.dart';

class AppState with ChangeNotifier {
  List<Client> clients;

  void sendMessage(Client sender, Client recipient, String message) {
    final package = Package(
      sender: sender,
      recipient: recipient,
      message: message,
    );
  }
}
