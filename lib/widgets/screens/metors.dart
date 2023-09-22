import 'package:flutter/cupertino.dart';
class Mentor {
  final String name;
  final String skill;
  final String field;
  final String bio;

  Mentor({
    required this.name,
    required this.skill,
    required this.field,
    required this.bio,
  });
}

class MentorAssignmentScreen extends StatefulWidget {
  @override
  _MentorAssignmentScreenState createState() => _MentorAssignmentScreenState();
}

class _MentorAssignmentScreenState extends State<MentorAssignmentScreen> {
  // Dummy data for mentors
  List<Mentor> mentors = [
    Mentor(
      name: 'John Doe',
      skill: 'Programming',
      field: 'Computer Science',
      bio: 'I have 10 years of experience in programming.',
    ),
    Mentor(
      name: 'Jane Smith',
      skill: 'Design',
      field: 'Graphic Design',
      bio: 'I am a professional graphic designer.',
    ),
    // Add more mentors as needed
  ];

  String selectedSkill = 'Programming';
  List<Mentor> filteredMentors = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered mentors
    filterMentors();
  }

  // Function to filter mentors based on selected skill
  void filterMentors() {
    setState(() {
      filteredMentors =
          mentors.where((mentor) => mentor.skill == selectedSkill).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Mentor Assignment'),
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
            Container(
              padding: EdgeInsets.all(16.0),
              child: CupertinoPicker(
                itemExtent: 40.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedSkill = mentors[index].skill;
                    filterMentors();
                  });
                },
                children: mentors
                    .map((mentor) => Text(mentor.skill))
                    .toSet()
                    .toList()
                    .map((skill) {
                  return skill;
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMentors.length,
                itemBuilder: (context, index) {
                  final mentor = filteredMentors[index];
                  return CupertinoListTile(
                    title: Text(mentor.name),
                    subtitle: Text(mentor.field),
                    trailing: Icon(CupertinoIcons.forward),
                    onTap: () {
                      // Handle mentor assignment here
                      showMentorAssignmentDialog(mentor);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMentorAssignmentDialog(Mentor mentor) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Assign Mentor'),
          content: Column(
            children: [
              Text('Mentor: ${mentor.name}'),
              Text('Field: ${mentor.field}'),
              Text('Bio: ${mentor.bio}'),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Assign'),
              onPressed: () {
                // Implement mentor assignment logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
