import 'package:flutter/material.dart';

void showAddItemDialog(BuildContext context, List<String> options, String selectedOption, Function(String) onChanged) {
  String newItem = ''; // New item to be added

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Item'),
        content: TextField(
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            newItem = value;
          },
          decoration: const InputDecoration(hintText: 'Enter item name'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (newItem.isNotEmpty && !options.contains(newItem)) {
                // Remove 'Add Item' from options before adding a new item
                options.remove('select category');
                options.add(newItem); // Add new item to the options list
                options.add('select category'); // Re-add 'Add Item' at the end
                selectedOption = newItem; // Select the newly added item
                onChanged(newItem); // Notify parent widget of the change
                Navigator.of(context).pop();
               // Close the dialog
              }
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );

}
