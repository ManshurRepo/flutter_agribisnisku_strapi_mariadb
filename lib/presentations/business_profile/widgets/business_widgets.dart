import 'package:flutter/material.dart';

class BusinessProfileWidget extends StatelessWidget {
  final String businessName;
  final String logo;
  final List<String> businessSectors;
  final String businessValue;
  final String aboutUs;

  const BusinessProfileWidget({
    Key? key,
    required this.businessName,
    required this.logo,
    required this.businessSectors,
    required this.businessValue,
    required this.aboutUs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              businessName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Image.asset(
                logo,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children: businessSectors.map((sector) {
                return Chip(
                  label: Text(sector),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text(
              'About Us: $aboutUs',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Our Value: $businessValue',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
