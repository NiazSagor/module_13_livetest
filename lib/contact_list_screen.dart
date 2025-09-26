import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final List<Map<String, String>> _contacts = [];

  void _addContact() {
    if (_nameController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      setState(() {
        _contacts.add({
          "name": _nameController.text,
          "number": _numberController.text,
        });
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  Widget _buildContactItem(int index) {
    final contact = _contacts[index];
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        leading: const Icon(Icons.person, size: 30),
        title: Text(
          contact["name"]!,
          style: const TextStyle(color: Colors.red),
        ),
        subtitle: Text(contact["number"]!),
        trailing: IconButton(
          icon: const Icon(Icons.call, color: Colors.blue),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact List")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: _addContact,
                child: const Text("Add"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) => _buildContactItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
