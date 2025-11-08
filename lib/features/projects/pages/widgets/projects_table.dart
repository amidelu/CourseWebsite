import 'package:course_website/features/projects/projects_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// (Assuming Project class is defined as above)

class ProjectsTable extends StatelessWidget {
  const ProjectsTable({super.key});
  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        // Adjust these proportions as needed
        final nameWidth = totalWidth * 0.25;
        final urlWidth = totalWidth * 0.45;
        final techStackWidth = totalWidth * 0.30;

        const headerColor = Colors.teal;
        const rowColorOdd = Colors.white;
        const rowColorEven = Color(0xffdddbdb);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: totalWidth),
            child: DataTable(
              columnSpacing: 10,
              horizontalMargin: 10,
              dataRowMinHeight: 30,
              dataRowMaxHeight: 60,
              border: TableBorder.all(color: Colors.blueGrey),
              headingRowColor: WidgetStateProperty.all(headerColor),

              // Define columns using proportional widths
              columns: <DataColumn>[
                _buildDataColumn('Project Name', nameWidth),
                _buildDataColumn('URL', urlWidth, textAlign: TextAlign.center),
                _buildDataColumn('Tech Stacks', techStackWidth),
              ],

              // **Dynamic Rows from List**
              rows: projects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                final color = index % 2 == 0 ? rowColorOdd : rowColorEven;

                return DataRow(
                  // Apply alternating row background color
                  color: WidgetStateProperty.resolveWith<Color?>((states) => color),
                  cells: <DataCell>[
                    // Use the project object data in DataCells
                    DataCell(_buildCellText(project.name, nameWidth)),
                    DataCell(_buildCellText(project.url, urlWidth, tapEnabled: true)),
                    DataCell(_buildCellText(project.techStack, techStackWidth)),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  // Helper function to build a DataColumn
  DataColumn _buildDataColumn(String label, double width, {TextAlign? textAlign}) {
    return DataColumn(
      label: SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: textAlign,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  // Helper function to build the Text widget inside a DataCell
  Widget _buildCellText(String text, double width, {bool? tapEnabled = false}) {
    return GestureDetector(
      onTap: () {
        tapEnabled == true ? openUrl(text) : null;
      },
      child: SizedBox(
        width: width,
        child: Text(text, maxLines: 4, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}