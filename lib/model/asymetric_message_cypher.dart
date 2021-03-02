import 'package:cryptography/cryptography.dart';

abstract class AsymetricMessageCypher {
  static const cipher = CipherWithAppendedMac(aesCtr, Hmac(sha256));

  static void encryptMessage() async {}
}
