import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Text('MENU')),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'), 
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              splashColor: Colors.blueGrey,
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: CupertinoColors.secondaryLabel,
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              child: Icon(Icons.add, color: Colors.cyan, size: 45),
            ),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {
          print('clicked');
        },
        child: Text('Some Text'),
      ),
    );
  }
}
