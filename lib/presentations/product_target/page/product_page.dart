// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/models/responses/product_target_response_model.dart';
import 'package:flutter_agribisnisku/presentations/product_target/bloc/product_target/product_target_bloc.dart';
import 'package:flutter_agribisnisku/presentations/product_target/widgets/target_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_product_target.dart';


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
        title: const Text('Business Targets',
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
                model.data.sort((a, b) {
                  return _getStatusPriority(a) - _getStatusPriority(b);
                });
                return ListView.builder(
                  itemCount: model.data.length,
                  itemBuilder: (context, index) {
                    return ProductTargetWidget(data: model.data[index]);
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
            return const AddProductTargetPage();
          }));
          // Saat kembali dari AddMarketingTargetPage, lakukan pengambilan ulang data
          context
              .read<ProductTargetBloc>()
              .add(const ProductTargetEvent.getAll());
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        tooltip: 'Add Product Target',
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
int _getStatusPriority(Product data) {
  switch (
      _calculateStatus(data.attributes.startDate, data.attributes.endDate)) {
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


