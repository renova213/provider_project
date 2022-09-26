import 'package:flutter/material.dart';

import 'add_contact_screen.dart';
import 'widgets/list_contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(),
      appBar: AppBar(
        title: const Text("My Contact"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  ListContact _body() {
    return const ListContact();
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddContact(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
