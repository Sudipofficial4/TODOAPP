import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/widgets/Todolist.dart';
import 'New.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void OnClick() {
    showModalBottomSheet(
      //backgroundColor: CupertinoColors.secondaryLabel,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 200,
            child: New(addtodo: addtodo),
            padding: EdgeInsets.all(4),
          ),
        );
      },
    );
  }

  List<String> todo = [];

  void addtodo({required String Todotext}) {
    if (todo.contains(Todotext)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Already Exists'),
            content: Text("The text already exists"),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },

                child: Text("close"),
              ),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      todo.insert(0, Todotext);
    });
    updatelocaldata();
    Navigator.pop(context);
  }

  void updatelocaldata() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todo', todo);
  }

  void loaddata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todo', todo);
    todo = (prefs.getStringList('todo') ?? []).toList();
    setState(() {});
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),

        child: Icon(Icons.add),

        onPressed: OnClick,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Todo App",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("https://www.sudipkoirala44.com.np/"));
              },
              leading: Icon(Icons.person_2),
              title: Text(
                "Get In Touch",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(
                  Uri.parse("https://www.facebook.com/sudip.koirala.415846"),
                );
              },
              leading: Icon(Icons.facebook),
              title: Text(
                "About me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
        actions: [Padding(padding: const EdgeInsets.all(8.0))],
      ),
      body: Todolist(todolist: todo, updatelocaldata: updatelocaldata),
    );
  }
}
