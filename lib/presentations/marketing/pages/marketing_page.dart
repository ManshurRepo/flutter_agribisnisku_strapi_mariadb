import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/marketing/pages/add_marketing_target.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text('Marketing Targets'),
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
        onPressed: ()  async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddMarketingTargetPage();
          }));
        },
        backgroundColor: Colors.green, // Atur warna background
        foregroundColor: Colors.white, // Atur warna ikon
        tooltip: 'Add Marketing Target', // Tambahkan tooltip
        child: const Icon(Icons.add), // Tambahkan ikon add
      ),
    );
  }
}
