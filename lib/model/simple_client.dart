import 'dart:typed_data';
import 'package:cypher_app/model/package.dart';
import 'dart:math';

import 'package:encrypt/encrypt.dart';

const int max = 100000;

class SimpleClient {
  String name;
  List<Package> directory;
  int openKey; //IV
  Key _secretKey;

  SimpleClient._(this.name);

  factory SimpleClient(String name) {
    SimpleClient client = SimpleClient._(name);
    final rng = Random();
    client._secretKey = Key.fromSecureRandom(16);
    client.openKey = rng.nextInt(max);
    client.directory = [];
    return client;
  }

  String get lastMessage =>
      directory.isNotEmpty ? directory.last.message : "Empty";

  Future<int> getMidNumber(int prime, int n) async {
    return pow(prime, _bytesToInteger(_secretKey.bytes)) % n;
  }

  void calculateSecretKey(int prime, int n, int midNum) {
    final int commonKey = pow(midNum, _bytesToInteger(_secretKey.bytes)) % n;
    _secretKey = Key.fromBase16(int32bytes(commonKey).toString());
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

  Uint8List int32bytes(int value) =>
      Uint8List(4)..buffer.asInt32List()[0] = value;

  int _bytesToInteger(List<int> bytes) {
    var value = 0;

    for (var i = 0, length = bytes.length; i < length; i++) {
      value += bytes[i] * pow(256, i);
    }

    return value;
  }
}
