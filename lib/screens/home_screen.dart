import 'package:flutter/material.dart';
import 'add_session_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> sessions = [];

  void _addSession(Map<String, dynamic> session) {
    setState(() {
      sessions.add(session);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sportball Coach Organizer', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFD62828),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF77F00)),
              child: Text('Add New Session'),
              onPressed: () async {
                final newSession = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSessionScreen()),
                );
                if (newSession != null) {
                  _addSession(newSession);
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: sessions.isEmpty
                  ? Center(child: Text("No sessions added yet."))
                  : ListView.builder(
                      itemCount: sessions.length,
                      itemBuilder: (context, index) {
                        final session = sessions[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text("${session['sport']} Class"),
                            subtitle: Text("Date: ${session['date'].toString().split(' ')[0]}"),
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
