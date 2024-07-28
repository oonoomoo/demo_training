import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String id;
  final String title;
  final String desc;
  final String imgUrl;
  final Function(String id) onEdit;
  final Function(String id) onDelete;

  MyCard({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.onEdit,
    required this.onDelete,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          log('Card tap!!');
          onEdit(id);
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            desc,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // InkWell(
              //   onTap: () {
              //     onEdit(id);
              //   },
              //   child: const Icon(
              //     Icons.edit,
              //     size: 24,
              //     color: Colors.blue,
              //   ),
              // ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  onDelete(id);
                },
                child: const Icon(
                  Icons.delete_forever,
                  size: 24,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
