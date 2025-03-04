import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AttendanceRecordsPage extends StatelessWidget {
  const AttendanceRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for attendance records
    final List<Map<String, dynamic>> attendanceData = [
      {'name': 'Alice', 'days_present': 18, 'days_absent': 2},
      {'name': 'Bob', 'days_present': 15, 'days_absent': 5},
      {'name': 'Charlie', 'days_present': 17, 'days_absent': 3},
      {'name': 'David', 'days_present': 20, 'days_absent': 0},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Attendance Records')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _buildAttendanceTable(attendanceData),
            ),
            SizedBox(height: 20),
            Text('Attendance Chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: _buildBarChart(attendanceData),
            ),
            SizedBox(height: 20),
            Text('Attendance Distribution', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: _buildPieChart(attendanceData),
            ),
          ],
        ),
      ),
    );
  }

  // Table displaying attendance records
  Widget _buildAttendanceTable(List<Map<String, dynamic>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Days Present')),
          DataColumn(label: Text('Days Absent')),
        ],
        rows: data.map((entry) {
          return DataRow(cells: [
            DataCell(Text(entry['name'])),
            DataCell(Text(entry['days_present'].toString())),
            DataCell(Text(entry['days_absent'].toString())),
          ]);
        }).toList(),
      ),
    );
  }

  // Bar chart to show attendance
  Widget _buildBarChart(List<Map<String, dynamic>> data) {
    return BarChart(
      BarChartData(
        barGroups: data.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> student = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: student['days_present'].toDouble(),
                color: Colors.blue,
                width: 15,
              ),
            ],
          );
        }).toList(),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  // Pie chart for attendance distribution
  Widget _buildPieChart(List<Map<String, dynamic>> data) {
    double totalPresent = data.fold(0, (sum, student) => sum + student['days_present']);
    double totalAbsent = data.fold(0, (sum, student) => sum + student['days_absent']);

    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: totalPresent, title: 'Present', color: Colors.blue),
          PieChartSectionData(value: totalAbsent, title: 'Absent', color: Colors.red),
        ],
      ),
    );
  }
}