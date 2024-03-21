// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/datasources/marketing_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/models/requests/add_target_request_model.dart';
import 'package:flutter_agribisnisku/presentations/marketing/widgets/edit_succes_alert.dart';

import '../../../data/models/responses/marketing_target_response_model.dart';

class EditMarketingPage extends StatefulWidget {
  final Marketing marketing;

  const EditMarketingPage({Key? key, required this.marketing})
      : super(key: key);

  @override
  State<EditMarketingPage> createState() => _EditMarketingPageState();
}

class _EditMarketingPageState extends State<EditMarketingPage> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;
  late TextEditingController _weightController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    final Attributes attributes = widget.marketing.attributes;
    _titleController = TextEditingController(text: attributes.title);
    _categoryController = TextEditingController(text: attributes.category);
    _weightController =
        TextEditingController(text: attributes.weight.toString());
    _startDateController =
        TextEditingController(text: attributes.startDate.toString());
    _endDateController =
        TextEditingController(text: attributes.endDate.toString());
    _descriptionController =
        TextEditingController(text: attributes.description);
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
        title: const Text('Edit Marketing Targets',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            DropdownButtonFormField<String>(
              value: _categoryController.text.isNotEmpty
                  ? _categoryController.text
                  : null,
              items: const [
                DropdownMenuItem<String>(
                  value: 'Kualitatif',
                  child: Text('Kualitatif'),
                ),
                DropdownMenuItem<String>(
                  value: 'Kuantitatif',
                  child: Text('Kuantitatif'),
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
                if (picked != null) {
                  setState(() {
                    _startDateController.text =
                        picked.toString().substring(0, 10);
                  });
                }
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
            ElevatedButton(
              onPressed: () async {
                final newModel = AddTargetRequestModel(
                  data: Data(
                    title: _titleController.text,
                    category: _categoryController.text,
                    weight: int.parse(_weightController.text),
                    startDate: DateTime.parse(_startDateController.text),
                    endDate: DateTime.parse(_endDateController.text),
                    description: _descriptionController.text,
                  ),
                );

                try {
                  await MarketingRemoteDataSource()
                      .editTask(widget.marketing.id, newModel);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const EditSuccessPage();
                  }));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Failed to edit task: $e'), 
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
