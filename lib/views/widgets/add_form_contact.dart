import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add_contact_controls.dart';

class AddFormContact extends StatefulWidget {
  const AddFormContact({super.key});

  @override
  State<AddFormContact> createState() => _AddFormContactState();
}

class _AddFormContactState extends State<AddFormContact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _nameFormField(),
          const SizedBox(height: 10),
          _numberPhoneField(),
          const SizedBox(height: 10),
          AddContactControls(
              formKey: _formKey,
              nameController: nameController,
              phoneController: phoneController),
        ],
      ),
    );
  }

  TextFormField _nameFormField() {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Nama",
        icon: const Icon(Icons.people),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nama tidak boleh kosong';
        } else {
          return null;
        }
      },
    );
  }

  TextFormField _numberPhoneField() {
    return TextFormField(
      controller: phoneController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(14),
      ],
      decoration: InputDecoration(
        hintText: "Nomor Telpon",
        icon: const Icon(Icons.phone),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nomor tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
