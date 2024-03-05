import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/presentations/product_target/bloc/product_target/product_target_bloc.dart';
import 'package:flutter_agribisnisku/presentations/product_target/widgets/target_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductTargetPage extends StatefulWidget {
  const ProductTargetPage({Key? key}) : super(key: key);

  @override
  State<ProductTargetPage> createState() => _ProductTargetPageState();
}
class _ProductTargetPageState extends State<ProductTargetPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductTargetBloc>()
        .add(const ProductTargetEvent.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketing Targets'),
      ),
      body: BlocBuilder<ProductTargetBloc, ProductTargetState>(
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
                    return ProductTargetWidget (data: model.data[index]);
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

