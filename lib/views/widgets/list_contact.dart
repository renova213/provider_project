import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/providers/contact_provider.dart';

import '../detail_contact.dart';
import 'contact_container.dart';

class ListContact extends StatefulWidget {
  const ListContact({
    super.key,
  });

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, contact, _) => ListView.builder(
        itemCount: contact.contacts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailContact(
                    contact: contact.contacts[index],
                    index: index,
                  ),
                ),
              );
            },
            child: ContactContainer(index: index),
          );
        },
      ),
    );
  }
}
