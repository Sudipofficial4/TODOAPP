import 'package:flutter/material.dart';

class New extends StatefulWidget {
  void Function({required String Todotext}) addtodo;

  New({super.key, required this.addtodo});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  TextEditingController todotext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("ADD TODO"),
        TextField(
          autofocus: true,
          controller: todotext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: 'Write Your TODO Here',
            //labelText: 'Username',
            //icon: Icon(Icons.swipe_up_sharp),
          ),
          //style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            if (todotext.text.isNotEmpty) {
              widget.addtodo(Todotext: todotext.text);
            }

            todotext.text = '';
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
