import 'package:cypher_app/model/package.dart';
import 'package:cypher_app/model/simple_client.dart';
import 'package:flutter/widgets.dart';

class AppState with ChangeNotifier {
  SimpleClient alice = SimpleClient("Alice");
  SimpleClient bob = SimpleClient("Bob");

  void sendMessage(
      SimpleClient sender, SimpleClient recipient, String message) async {
    final int prime = 7;
    final int n = 11;

    final midSender = await sender.getMidNumber(prime, n);
    final midRecipient = await recipient.getMidNumber(prime, n);

    sender.calculateSecretKey(prime, n, midRecipient);
    recipient.calculateSecretKey(prime, n, midSender);

    final encryptedMessage = sender.encryptMessage(message);

    final package = Package(
      sender: sender,
      recipient: recipient,
      message: encryptedMessage,
    );

    sender.addPackage(package);
    recipient.addPackage(package);
    notifyListeners();
  }
}
