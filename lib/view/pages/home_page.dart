import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: Text('Try cipher')),
      body: ListView(
        children: [
          ListTile(
            title: Text("Last message from Alice"),
            subtitle: Text(provider.alice.lastMessage),
          ),
          ListTile(
            title: Text("Last message from Bob"),
            subtitle: Text(provider.alice.lastMessage),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () => provider.sendMessage(
          provider.alice,
          provider.bob,
          "Hello there!",
        ),
      ),
    );
  }
}
