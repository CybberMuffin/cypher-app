import 'package:cypher_app/model/client.dart';

class Package {
  Client sender;
  Client recipient;
  String message;

  Package({this.sender, this.recipient, this.message});
}
