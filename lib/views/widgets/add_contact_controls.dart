import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/contact_provider.dart';

import '../../models/contact_model.dart';

class AddContactControls extends StatelessWidget {
  const AddContactControls({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contact, _) => ElevatedButton(
        child: const Text(
          "Submit",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            contact.addContact(
              ContactModel(
                  name: nameController.text, phone: phoneController.text),
            );
            Fluttertoast.showToast(msg: "Contact berhasil ditambahkan");
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
