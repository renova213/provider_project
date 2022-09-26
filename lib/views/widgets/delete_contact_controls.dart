import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/contact_provider.dart';

import '../contact_screen.dart';
import '../detail_contact.dart';

class DeleteContactControls extends StatelessWidget {
  const DeleteContactControls({
    super.key,
    required this.widget,
  });

  final DetailContact widget;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contact, _) => TextButton(
        onPressed: () async {
          contact.deleteContact(widget.index);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ContactScreen(),
            ),
          );
          Fluttertoast.showToast(msg: "Contact Berhasil Dihapus");
        },
        child: const Text("Yes"),
      ),
    );
  }
}
