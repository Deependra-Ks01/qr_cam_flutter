import 'package:flutter/material.dart';

class QueriesPage extends StatelessWidget {
  const QueriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example student queries (Replace with actual data fetching from Firestore or DB)
    List<Map<String, String>> queries = [
      {"student": "John Doe", "query": "My attendance for 10th Feb is not marked."},
      {"student": "Jane Smith", "query": "I attended the class but my name is absent."},
      {"student": "Alex Brown", "query": "Is there a way to check past attendance records?"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Student Queries")),
      body: ListView.builder(
        itemCount: queries.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(queries[index]["student"]!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(queries[index]["query"]!),
            ),
          );
        },
      ),
    );
  }
}
