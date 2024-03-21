// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/add_marketing_target.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/responses/marketing_target_response_model.dart';
import '../bloc/marketing_target/marketing_target_bloc.dart';
import '../widgets/target_widget.dart';

class MarketingTargetPage extends StatefulWidget {
  const MarketingTargetPage({Key? key}) : super(key: key);

  @override
  State<MarketingTargetPage> createState() => _MarketingTargetPageState();
}

class _MarketingTargetPageState extends State<MarketingTargetPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<MarketingTargetBloc>()
        .add(const MarketingTargetEvent.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketing Targets',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            textAlign: TextAlign.end),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigasikan ke halaman utama (Home Page)
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: BlocBuilder<MarketingTargetBloc, MarketingTargetState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (model) {
              if (model.data.isEmpty) {
                return const Center(
                  child: Text('No data available'),
                );
              } else {
                model.data.sort((a, b) {
                  return _getStatusPriority(a) - _getStatusPriority(b);
                });
                return ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    return MarketingTargetWidget(data: model.data[index]);
                  },
                );
              }
            },
            orElse: () => const Center(
              child: Text('Failed to load data'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddMarketingTargetPage();
          }));
          // Saat kembali dari AddMarketingTargetPage, lakukan pengambilan ulang data
          context
              .read<MarketingTargetBloc>()
              .add(const MarketingTargetEvent.getAll());
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        tooltip: 'Add Marketing Target',
        child: const Icon(Icons.add), 
      ),
      backgroundColor: Colors.white,
    );
  }
}

// Tambahkan bagian ini di dalam kelas _MarketingTargetPageState
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


// Fungsi untuk mendapatkan prioritas status
  int _getStatusPriority(Marketing data) {
    switch (_calculateStatus(data.attributes.startDate, data.attributes.endDate)) {
      case 'to do':
        return 0;
      case 'in progress':
        return 1;
      case 'done':
        return 2;
      default:
        return 3;
    }
  }
