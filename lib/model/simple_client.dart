import 'package:cryptography/cryptography.dart';
import 'package:cypher_app/model/asymetric_message_cypher.dart';
import 'package:cypher_app/model/package.dart';
import 'dart:math';

const int max = 100000;

class SimpleClient {
  String name;
  List<Package> directory;
  int openKey; //IV
  int _secretKey;

  SimpleClient._(this.name);

  factory SimpleClient(String name) {
    SimpleClient client = SimpleClient._(name);
    final rng = Random();
    client._secretKey = rng.nextInt(max);
    client.openKey = rng.nextInt(max);
    client.directory = [];
    return client;
  }

  String get lastMessage =>
      directory.isNotEmpty ? directory.last.message : "Empty";

  Future<int> getMidNumber(int prime, int n) async {
    return pow(prime, _secretKey) % n;
  }

  void calculateSecretKey(int prime, int n, int midNum) {
    final commonKey = pow(midNum, _secretKey) % n;
    _secretKey = commonKey;
  }

  String encryptMessage(String message) {
    print("$name's secret key is $_secretKey");
    return message;
  }

  String _decryptMessage(String message) {
    print("$name's secret key is $_secretKey");
    return message;
  }

  void addPackage(Package package) {
    if (package.recipient.name == name) {
      package.message = _decryptMessage(package.message);
    }

    directory.add(package);
  }
}
