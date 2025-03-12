import 'package:flutter/material.dart';

class RosterScreen extends StatefulWidget {
  final Function(Map<String, dynamic>)? onChildAdded;

  const RosterScreen({this.onChildAdded, Key? key}) : super(key: key);

  @override
  _RosterScreenState createState() => _RosterScreenState();
}

class _RosterScreenState extends State<RosterScreen> {
  List<Map<String, dynamic>> roster = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _addChild() {
    final child = {
      'name': nameController.text,
      'age': ageController.text,
      'email': emailController.text,
    };
    setState(() {
      roster.add(child);
    });
    if (widget.onChildAdded != null) widget.onChildAdded!(child);
    nameController.clear();
    ageController.clear();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Roster', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFD62828),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Child's Name")),
            TextField(controller: ageController, decoration: InputDecoration(labelText: "Age")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Parent Email")),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addChild,
              child: Text('Add Child'),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD62828)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: roster.length,
                itemBuilder: (context, index) {
                  final child = roster[index];
                  return ListTile(
                    title: Text(child['name']),
                    subtitle: Text("Age: ${child['age']} | Parent: ${child['email']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          roster.removeAt(index);
                        });
                      },
                    ),
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
