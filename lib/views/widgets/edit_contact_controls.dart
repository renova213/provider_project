import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/contact_provider.dart';
import 'package:provider_project/views/contact_screen.dart';

import '../../models/contact_model.dart';
import '../edit_contact_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditContactControls extends StatefulWidget {
  const EditContactControls(
      {super.key,
      required this.formKey,
      required this.widget,
      required this.context,
      required this.nameController,
      required this.phoneController});

  final GlobalKey<FormState> formKey;
  final EditContactScreen widget;
  final BuildContext context;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  State<EditContactControls> createState() => _EditContactControlsState();
}

class _EditContactControlsState extends State<EditContactControls> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contact, _) => ElevatedButton(
        child: const Text(
          "Edit",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          if (widget.formKey.currentState!.validate()) {
            if (widget.nameController.text == widget.widget.contact.name &&
                widget.phoneController.text == widget.widget.contact.phone) {
              Navigator.pop(context);
            } else {
              contact.editContact(
                  ContactModel(
                      name: widget.nameController.text,
                      phone: widget.phoneController.text),
                  widget.widget.index);
              Fluttertoast.showToast(msg: "Contact berhasil diubah");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                  (route) => false);
            }
          }
        },
      ),
    );
  }
}
