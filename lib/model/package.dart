import 'package:cypher_app/model/client.dart';
import 'package:cypher_app/model/simple_client.dart';

class Package {
  SimpleClient sender;
  SimpleClient recipient;
  String message;

  Package({this.sender, this.recipient, this.message});
}
