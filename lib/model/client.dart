import 'package:cryptography/cryptography.dart';
import 'package:cypher_app/model/asymetric_message_cypher.dart';
import 'package:cypher_app/model/package.dart';
import 'dart:math';

class Client {
  String name;
  List<Package> directory;
  Nonce openKey; //IV
  SecretKey _secretKey;

  Client._(this.name);

  factory Client(String name) {
    Client client = Client._(name);
    client._secretKey = SecretKey.randomBytes(16);
    client.openKey = Nonce.randomBytes(12);
    return client;
  }

  Future<int> getMidNumber(int prime, int n) async {
    return pow(prime, _bytesToInteger(await _secretKey.extract())) % n;
  }

  void calculateSecretKey(int prime, int n, int midNum) async {
    final commonKey =
        pow(midNum, _bytesToInteger(await _secretKey.extract())) % n;
  }

  Future<void> sendMessage(Client recipient, String message) async {
    final encryptedMessage = AsymetricMessageCypher.encryptMessage();
    final List list = await _secretKey.extract();
  }

  int _bytesToInteger(List<int> bytes) {
    var value = 0;

    for (var i = 0, length = bytes.length; i < length; i++) {
      value += bytes[i] * pow(256, i);
    }

    return value;
  }
}
