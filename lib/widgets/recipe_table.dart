import 'package:flutter/material.dart';

class Recipetbl extends StatefulWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  // ignore: use_key_in_widget_constructors
  const Recipetbl({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  State<Recipetbl> createState() => _RecipetblState();
}

class _RecipetblState extends State<Recipetbl> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
        DataColumn(label: Text('')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              CircleAvatar(
                backgroundImage: NetworkImage(widget.thumbnailUrl),
              ),
            ),
            DataCell(
              Text(widget.title),
              onTap: () {
                // Scaffold.of(context)
                //     // ignore: deprecated_member_use
                //     .showSnackBar(SnackBar(content: Text(widget.cookTime)));
              },
            ),
            DataCell(Text(widget.cookTime), onTap: () {}),
            DataCell(Text(widget.rating)),
          ],
        ),
      ],
    );
  }
}
