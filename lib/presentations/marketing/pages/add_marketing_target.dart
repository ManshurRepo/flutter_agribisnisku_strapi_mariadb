import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/models/requests/add_target_request_model.dart';
import 'package:flutter_agribisnisku/presentations/marketing/bloc/add_target/add_target_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMarketingTargetPage extends StatefulWidget {
  const AddMarketingTargetPage({Key? key}) : super(key: key);

  @override
  State<AddMarketingTargetPage> createState() => _AddMarketingTargetPageState();
}

class _AddMarketingTargetPageState extends State<AddMarketingTargetPage> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;
  late TextEditingController _weightController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _categoryController = TextEditingController();
    _weightController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _weightController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Target', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          } ,
          icon: const Icon(
            Icons.arrow_back, color: Colors.white,
          )
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            // TextFormField(
            //   controller: _categoryController,
            //   decoration: InputDecoration(labelText: 'Category'),
            // ),
            DropdownButtonFormField<String>(
              value: _categoryController.text.isNotEmpty
                  ? _categoryController.text
                  : null,
              items: const [
                DropdownMenuItem<String>(
                  value: 'Kualitatif',
                  child: Text('Kualitatif', style: TextStyle(fontWeight: FontWeight.normal),),
                ),
                DropdownMenuItem<String>(
                  value: 'Kuantitatif',
                  child: Text('Kuantitatif', style:  TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  _categoryController.text = newValue!;
                });
              },
              decoration: const InputDecoration(labelText: 'Kategori'),
            ),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _startDateController,
              decoration: const InputDecoration(labelText: 'Start Date'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null)
                  // ignore: curly_braces_in_flow_control_structures
                  setState(() {
                    _startDateController.text =
                        picked.toString().substring(0, 10);
                  });
              },
            ),
            TextFormField(
              controller: _endDateController,
              decoration: const InputDecoration(labelText: 'End Date'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    _endDateController.text =
                        picked.toString().substring(0, 10);
                  });
                }
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: null,
            ),
            const SizedBox(height: 16.0),
            BlocListener<AddTargetBloc, AddTargetState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (_) {
                    Navigator.pop(context);
                  },
                  orElse: () {},
                );
              },
              child: BlocBuilder<AddTargetBloc, AddTargetState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => ElevatedButton(
                      onPressed: () {
                        final model = AddTargetRequestModel(
                          data: Data(
                            title: _titleController.text,
                            category: _categoryController.text,
                            weight: int.parse(_weightController.text),
                            startDate:
                                DateTime.parse(_startDateController.text),
                            endDate: DateTime.parse(_endDateController.text),
                            description: _descriptionController.text,
                          ),
                        );
                        context.read<AddTargetBloc>().add(
                              AddTargetEvent.addMarketingTarget(model),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
