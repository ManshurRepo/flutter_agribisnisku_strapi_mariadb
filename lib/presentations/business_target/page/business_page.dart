import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/business_target/bloc/business_targets/business_target_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/business_widget.dart';




class BusinessTargetPage extends StatefulWidget {
  const BusinessTargetPage({Key? key}) : super(key: key);

  @override
  State<BusinessTargetPage> createState() => _BusinessTargetPageState();
}
class _BusinessTargetPageState extends State<BusinessTargetPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<BusinessTargetBloc>()
        .add(const BusinessTargetEvent.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketing Targets'),
      ),
      body: BlocBuilder<BusinessTargetBloc, BusinessTargetState>(
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
                return ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    return BusinessTargetWidget (data: model.data[index]);
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
        onPressed: () {
          // Tambahkan logika untuk menangani penekanan floating action button di sini
        },
        backgroundColor: Colors.green, // Atur warna background
        foregroundColor: Colors.white, // Atur warna ikon
        tooltip: 'Add Marketing Target', // Tambahkan tooltip
        child: const Icon(Icons.add), // Tambahkan ikon add
      ),
    );
  }
}

