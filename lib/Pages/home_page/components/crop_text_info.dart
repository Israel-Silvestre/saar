import 'package:flutter/material.dart';

class CropTextInfo extends StatelessWidget {
  final String title;
  final String description;

  const CropTextInfo({
    super.key,
    required this.title,
    required this.description,
  });

  TextStyle headerStyle() => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 8, right:8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title, style: headerStyle()),
        Text(description, style: const TextStyle(fontFamily: 'Roboto')),
      ],
    ),
  );
}
