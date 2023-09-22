import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillSelectionScreen extends StatefulWidget {
  @override
  _SkillSelectionScreenState createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
  String selectedSkill = '';
  String selectedCourse = '';
  String jobCompany = '';

  final Map<String, List<String>> skillsData = {
    'Programming': ['Java', 'Python', 'C++'],
    'Design': ['UI/UX Design', 'Graphic Design'],
    'Data Science': ['Machine Learning', 'Data Analysis'],
  };

  final Map<String, String> courseData = {
    'Java': 'Java Programming Course',
    'Python': 'Python Programming Course',
    'C++': 'C++ Programming Course',
    'UI/UX Design': 'UI/UX Design Course',
    'Graphic Design': 'Graphic Design Course',
    'Machine Learning': 'Machine Learning Course',
    'Data Analysis': 'Data Analysis Course',
  };

  final Map<String, String> jobData = {
    'Java Programming Course': 'ABC Inc.',
    'Python Programming Course': 'XYZ Corp.',
    'C++ Programming Course': 'Tech Solutions Ltd.',
    'UI/UX Design Course': 'Designers R Us',
    'Graphic Design Course': 'Creative Studios',
    'Machine Learning Course': 'Data Innovators',
    'Data Analysis Course': 'Info Analytics',
  };

  void _selectSkill(String skill) {
    setState(() {
      selectedSkill = skill;
      selectedCourse = '';
      jobCompany = '';
    });
  }

  void _selectCourse(String course) {
    setState(() {
      selectedCourse = course;
      jobCompany = jobData[course] ?? 'No company information available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Skill Selection'),
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoPicker(
              itemExtent: 40.0,
              onSelectedItemChanged: (int index) {
                final selectedSkill = skillsData.keys.toList()[index];
                _selectSkill(selectedSkill);
              },
              children: skillsData.keys.map((skill) {
                return Center(
                  child: Text(
                    skill,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                );
              }).toList(),
            ),
            if (selectedSkill.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Choose a Course for $selectedSkill:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                  CupertinoPicker(
                    itemExtent: 40.0,
                    onSelectedItemChanged: (int index) {
                      final selectedCourse = skillsData[selectedSkill]![index];
                      _selectCourse(selectedCourse);
                    },
                    children: skillsData[selectedSkill]!.map((course) {
                      return Center(
                        child: Text(
                          course,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.none),
                        ),
                      );
                    }).toList(),
                  ),
                  if (selectedCourse.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Job Opportunity: $jobCompany',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.none),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
