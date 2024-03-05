import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/models/responses/business_target_response_model.dart';
import 'package:intl/intl.dart';

class BusinessTargetWidget extends StatelessWidget {
  final Business data;

  const BusinessTargetWidget({Key? key, required this.data}) : super(key: key);

  String _calculateStatus(DateTime startDate, DateTime endDate) {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

    if (endDate.isBefore(yesterday)) {
      return 'done';
    } else if (startDate.isBefore(yesterday) && endDate.isAfter(tomorrow)) {
      return 'in progress';
    } else if (startDate.isAfter(tomorrow)) {
      return 'to do';
    } else {
      return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    String calculatedStatus =
        _calculateStatus(data.attributes.startDate, data.attributes.endDate);

    String formattedStartDate =
        DateFormat('dd/MM/yyyy').format(data.attributes.startDate);
    String formattedEndDate =
        DateFormat('dd/MM/yyyy').format(data.attributes.endDate);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Target Title: ${data.attributes.title}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Description: ${data.attributes.description}'),
            Text('Category: ${data.attributes.category}'),
            Text('Weight: ${data.attributes.weight}'),
            Text(
                'Start Date: $formattedStartDate'),
            Text(
                'End Date: $formattedEndDate'),
            Text('Status: $calculatedStatus'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Tambahkan logika untuk tombol edit di sini
                  },
                  color: Colors.blue,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Tambahkan logika untuk tombol hapus di sini
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



