import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Add Contact"),
      centerTitle: true,
    );
  }

  AddFormContact _body() {
    return const AddFormContact();
  }
}
