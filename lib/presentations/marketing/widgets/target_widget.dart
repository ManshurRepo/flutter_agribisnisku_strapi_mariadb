// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/datasources/marketing_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/models/responses/marketing_target_response_model.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/edit_marketing_target.dart';
import 'package:intl/intl.dart';

import 'delete_succes_alert.dart';

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
      return 'to do';
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

    // Set color based on status
    Color statusColor;
    switch (calculatedStatus) {
      case 'to do':
        statusColor = Colors.green;
        break;
      case 'in progress':
        statusColor = Colors.blue;
        break;
      case 'done':
        statusColor = Colors.grey;
        break;
      default:
        statusColor = Colors.black;
    }

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
            Row(
              children: [
                const Text(
                  'Status: ',
                ),
                Text(
                  calculatedStatus,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditMarketingPage(marketing: data);
                    }));
                  },
                  color: Colors.blue,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                    onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: const Text(
                                'Apakah anda yakin akan menghapus kegiatan ini?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No')),
                              TextButton(
                                  onPressed: () async {
                                    await MarketingRemoteDataSource()
                                        .deleteTarget(data.id);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const DeleteSuccessPage();
                                    }));
                                  },
                                  child: const Text('Yes')),
                            ],
                          );
                        });
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
