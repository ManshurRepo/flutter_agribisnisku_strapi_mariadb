import 'package:flutter/material.dart';

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
        title: Text('Add Target'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _startDateController,
              decoration: InputDecoration(labelText: 'Start Date'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null)
                  setState(() {
                    _startDateController.text =
                        picked.toString().substring(0, 10);
                  });
              },
            ),
            TextFormField(
              controller: _endDateController,
              decoration: InputDecoration(labelText: 'End Date'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null)
                  setState(() {
                    _endDateController.text =
                        picked.toString().substring(0, 10);
                  });
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              child: const Text('Submit', style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}
