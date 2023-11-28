import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.icon,
    required this.name,
    required this.function,
  });

  String name;
  IconData icon;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: function,
          leading: CircleAvatar(
            radius: 20,
            child: Icon(
              icon,
              color: Colors.deepPurple,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 15),
          ),
          trailing:
              IconButton(icon: Icon(Icons.navigate_next), onPressed: function),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: Colors.black12,
            indent: 10,
            endIndent: 25,
          ),
        ),
      ],
    );
  }
}
