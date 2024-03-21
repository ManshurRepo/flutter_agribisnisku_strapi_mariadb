// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/models/responses/business_profile_response_model.dart';

import '../../../core/constants/variabels.dart';

class BusinessProfileWidget extends StatelessWidget {
  final BusinessProfile data;



  const BusinessProfileWidget({Key? key, required this.data}) : super(key: key);

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
            Center(
            child : Text(
              data.attributes.businessName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            ),
            const SizedBox(height: 0),
            Center(
              child: Image.network(
                '${Variables.baseUrl}${data.attributes.businessLogo.data.attributes.url}',
                width: 220,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 0),
            const Text(
              'Business Sector: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            Text(data.attributes.businessSectors),
            const SizedBox(height: 8),
            const Text(
              'About Us: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            Text(data.attributes.aboutUs),
            const SizedBox(height: 8),
            const Text(
              'Our Value:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            Text(data.attributes.businessValue),
          ],
        ),
      ),
    );
  }
}
