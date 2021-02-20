import 'package:cypher_app/model/client.dart';
import 'package:cypher_app/model/package.dart';
import 'package:flutter/widgets.dart';

class AppState with ChangeNotifier {
  Client alice = Client("Alice");
  Client bob = Client("Bob");

  void sendMessage(Client sender, Client recipient, String message) async {
    final int primeNumber = 7;
    final int n = 11;

    final midSender = await sender.getMidNumber(primeNumber, n);
    final midRecipient = await recipient.getMidNumber(primeNumber, n);

    final package = Package(
      sender: sender,
      recipient: recipient,
      message: message,
    );
  }
}
