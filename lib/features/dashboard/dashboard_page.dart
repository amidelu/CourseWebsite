import 'package:course_website/features/courses/pages/course_list_page.dart';
import 'package:course_website/features/projects/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final List<Widget> _bodyPage = [
    const ProjectsPage(),
    const CourseListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Future<void> openUrl(String url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            leading: Column(
              children: [
                Image.asset('assets/images/pic_t_shirt.png', height: 200, fit: BoxFit.cover),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: Column(
                        children: [
                          Text('Mohammad Delowar Hossain', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('+880 1616502240 (Whatsapp)'),
                          const SizedBox(height: 4),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                onTap: () => openUrl('https://github.com/amidelu'),
                                child: Text('https://github.com/amidelu'),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
            leadingAtTop: true,
            selectedIndex: selectedIndex,
            backgroundColor: Colors.teal,
            minWidth: width / 6,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.list_alt_outlined),
                selectedIcon: Icon(Icons.list_alt),
                label: Text('Projects', style: TextStyle(fontSize: 16, color: Colors.white),),
                padding: EdgeInsets.all(10),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.list_outlined),
                selectedIcon: Icon(Icons.list),
                label: Text('Courses', style: TextStyle(fontSize: 16, color: Colors.white),),
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
          Expanded(
              child: _bodyPage[selectedIndex],
          ),
        ],
      ),
    );
  }
}
