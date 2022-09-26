import 'dart:math';

import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import 'edit_contact_screen.dart';
import 'widgets/delete_contact_controls.dart';

class DetailContact extends StatefulWidget {
  final ContactModel contact;
  final int index;
  const DetailContact({super.key, required this.contact, required this.index});

  @override
  State<DetailContact> createState() => _DetailContactState();
}

class _DetailContactState extends State<DetailContact> {
  Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Column _body() {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: randomColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.contact.name[0],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(
                Icons.phone,
                size: 28,
              ),
              const SizedBox(width: 8),
              Text(
                widget.contact.phone,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        PopupMenuButton(
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditContactScreen(
                            contact: widget.contact, index: widget.index),
                      ),
                    );
                  },
                  child: const Text("Edit"),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Apakah Yakin Ingin Dihapus?"),
                          content: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DeleteContactControls(widget: widget),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Delete"),
                ),
              )
            ];
          },
        )
      ],
    );
  }
}
