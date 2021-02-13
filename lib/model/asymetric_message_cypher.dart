import 'dart:convert';
import 'package:cryptography/cryptography.dart';

abstract class AsymetricMessageCypher {
  static const cipher = CipherWithAppendedMac(aesCtr, Hmac(sha256));

  static void encryptMessage() async {
    // Choose some 256-bit secret key
    final secretKey = SecretKey.randomBytes(16);

    // Choose some unique (non-secret) nonce (max 16 bytes).
    // The same (secretKey, nonce) combination should not be used twice!
    final nonce = Nonce.randomBytes(12);

    // Our message
    final message = utf8.encode('encrypted message');

    // Encrypt
    final encrypted = await cipher.encrypt(
      message,
      secretKey: secretKey,
      nonce: nonce,
    );

    print('Encrypted: $encrypted');
  }
}
