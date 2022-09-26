import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final List<ContactModel> _contacts = [
    ContactModel(name: "Cayadi Permadi", phone: "091130202360"),
    ContactModel(name: "Saiful Nugroho", phone: "045204584722"),
    ContactModel(name: "Galang Uwais", phone: "05561470355"),
    ContactModel(name: "Nurul Haryanti", phone: "019049661022"),
    ContactModel(name: "Tami Rahimah", phone: "068300087681"),
    ContactModel(name: "Maman Widodo", phone: "099649518793"),
    ContactModel(name: "Kartika Anggraini", phone: "04147415555"),
    ContactModel(name: "Rachel Puspita", phone: "057605241637"),
    ContactModel(name: "Dono Kusumo", phone: "060493985256"),
    ContactModel(name: "Zalindra Mardhiyah", phone: "09845602105"),
  ];

  List<ContactModel> get contacts => _contacts;

  addContact(ContactModel contact) {
    _contacts.add(contact);
    _contacts
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }

  deleteContact(int index) {
    _contacts.removeAt(index);
    contacts
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }

  editContact(ContactModel contact, int index) {
    _contacts[index] = contact;
    contacts
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }
}
