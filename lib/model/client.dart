import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:cypher_app/model/asymetric_message_cypher.dart';
import 'package:cypher_app/model/package.dart';

class Client {
  String name;
  List<Package> directory;
  Nonce openKey; //IV
  SecretKey _secretKey;
  List<Client> connectedClients;

  Client._(this.name);

  factory Client(String name) {
    Client client = Client._(name);
    client._secretKey = SecretKey.randomBytes(16);
    client.openKey = Nonce.randomBytes(12);
    return client;
  }

  Future<void> sendMessage(Client recipient, String message) async {
    final encryptedMessage = AsymetricMessageCypher.encryptMessage();
    final List list = await _secretKey.extract();
  }
}
