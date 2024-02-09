import 'package:flutter/material.dart';

class SoilTextInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const SoilTextInfo({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Text(subtitle, style: const TextStyle(fontSize: 15))
    ]
  );
}