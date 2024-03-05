import 'package:flutter/material.dart';

import '../../../data/models/responses/marketing_target_response_model.dart';

class EditMarketingPage extends StatefulWidget {
  final Marketing marketing;

  const EditMarketingPage({Key? key, required this.marketing}) : super(key: key);

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
        title: const Text('Edit Target'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _startDateController,
              decoration: const InputDecoration(labelText: 'Start Date'),
            ),
            TextFormField(
              controller: _endDateController,
              decoration: const InputDecoration(labelText: 'End Date'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: null,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green),
              child: const Text('Save', style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
