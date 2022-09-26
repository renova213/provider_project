import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../providers/contact_provider.dart';

class ContactContainer extends StatefulWidget {
  final int index;
  const ContactContainer({super.key, required this.index});

  @override
  State<ContactContainer> createState() => _ContactContainerState();
}

class _ContactContainerState extends State<ContactContainer> {
  Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contact, _) => ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: randomColor,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
            contact.contacts[widget.index].name[0],
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        title: Text(contact.contacts[widget.index].name),
        subtitle: Text(contact.contacts[widget.index].phone),
      ),
    );
  }
}
