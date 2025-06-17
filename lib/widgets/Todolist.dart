import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  List<String> todolist;
  void Function() updatelocaldata;
  Todolist({super.key, required this.todolist, required this.updatelocaldata});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  //this function gets activated when the buttom is tapped

  void onItemClicked({required int index}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.todolist.removeAt(index);
              });
              widget.updatelocaldata();
              Navigator.pop(context);
            },
            child: Text('Mark as Done'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todolist.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            onItemClicked(index: index);
          },
          title: Text(widget.todolist[index]),
        );
      },
    );
  }
}
