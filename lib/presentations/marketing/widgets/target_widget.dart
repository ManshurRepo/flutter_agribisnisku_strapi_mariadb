import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/models/responses/marketing_target_response_model.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/edit_marketing_target.dart';
import 'package:intl/intl.dart';

class MarketingTargetWidget extends StatelessWidget {
  final Marketing data;

  const MarketingTargetWidget({Key? key, required this.data}) : super(key: key);

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
            Text('Start Date: $formattedStartDate'),
            Text('End Date: $formattedEndDate'),
            Text('Status: $calculatedStatus'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditMarketingPage(marketing: data),
                      ),
                    );
                  },
                  color: Colors.blue,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    // ignore: unused_local_variable
                    bool confirmed = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Konfirmasi'),
                        content: const Text(
                            'Apakah Anda yakin ingin menghapus target ini?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Tidak'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Ya'),
                          ),
                        ],
                      ),
                    );
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
