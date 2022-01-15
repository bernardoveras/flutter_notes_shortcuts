import 'package:flutter/material.dart';

class NoteItemWidget extends StatelessWidget {
  const NoteItemWidget(
    this.note, {
    Key? key,
    this.onDelete,
  }) : super(key: key);

  final String note;
  final Function(String)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            note,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              if (onDelete != null) onDelete!.call(note);
            },
          ),
        ],
      ),
    );
  }
}
