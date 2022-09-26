import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/contact_model.dart';
import 'widgets/widgets.dart';

class EditContactScreen extends StatefulWidget {
  final ContactModel contact;
  final int index;
  const EditContactScreen(
      {super.key, required this.contact, required this.index});

  @override
  State<EditContactScreen> createState() => _EditContactState();
}

class _EditContactState extends State<EditContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.contact.name;
    phoneController.text = widget.contact.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.contact.name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _nameFormField(),
            const SizedBox(height: 10),
            _phoneFormField(),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: EditContactControls(
                formKey: _formKey,
                widget: widget,
                context: context,
                nameController: nameController,
                phoneController: phoneController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _nameFormField() {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "nama",
        icon: const Icon(Icons.people),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
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

  TextFormField _phoneFormField() {
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
