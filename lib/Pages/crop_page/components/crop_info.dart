import 'package:flutter/material.dart';

class CropTextInfo extends StatelessWidget {
  final String name;
  final String description;

  const CropTextInfo({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, overflow: TextOverflow.ellipsis)),
        Text(description, style: const TextStyle(overflow: TextOverflow.ellipsis)),
      ],
    ),
  );
}
