import 'package:flutter/material.dart';
import 'roster_screen.dart';

class AddSessionScreen extends StatefulWidget {
  @override
  _AddSessionScreenState createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  final List<String> sports = ['Soccer', 'Basketball', 'Baseball', 'Hockey', 'Football'];
  String selectedSport = 'Soccer';
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> assignedKids = [];

  void _openRosterManager() async {
    final child = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RosterScreen()),
    );

    if (child != null) {
      setState(() {
        assignedKids.add(child);
      });
    }
  }

  void _saveSession() {
    final session = {
      'sport': selectedSport,
      'date': selectedDate,
      'assignedKids': assignedKids,
    };
    Navigator.pop(context, session); // Return to HomeScreen with full session object
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Session', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFD62828),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: selectedSport,
              decoration: InputDecoration(labelText: "Select Sport"),
              items: sports.map((sport) {
                return DropdownMenuItem(value: sport, child: Text(sport));
              }).toList(),
              onChanged: (value) => setState(() => selectedSport = value!),
            ),
            ListTile(
              title: Text("Date: ${selectedDate.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2030),
                );
                if (date != null) setState(() => selectedDate = date);
              },
            ),
            ElevatedButton(
              onPressed: _openRosterManager,
              child: Text("Add Kids to Class"),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF003049)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: assignedKids.length,
                itemBuilder: (context, index) {
                  final kid = assignedKids[index];
                  return ListTile(title: Text(kid['name']));
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveSession,
              child: Text("Save Session"),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD62828)),
            ),
          ],
        ),
      ),
    );
  }
}
