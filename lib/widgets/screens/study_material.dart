import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoApp(
    home: StudyMaterialApp(),
  ));
}

class StudyMaterialApp extends StatefulWidget {
  const StudyMaterialApp({Key? key}) : super(key: key);

  @override
  _StudyMaterialAppState createState() => _StudyMaterialAppState();
}

class _StudyMaterialAppState extends State<StudyMaterialApp> {
  List<StudyMaterial> studyMaterials = [
    StudyMaterial(
      category: 'Cybersecurity',
      title: 'Intro to Cybersecurity',
      description: 'Learn the basics of cybersecurity.',
    ),
    StudyMaterial(
      category: 'Cybersecurity',
      title: 'Network Security',
      description: 'Explore network security concepts.',
    ),
    StudyMaterial(
      category: '3D Animation',
      title: '3D Modeling Techniques',
      description: 'Master 3D modeling for animation.',
    ),
    StudyMaterial(
      category: '3D Animation',
      title: 'Animation Principles',
      description: 'Learn animation principles and techniques.',
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'Graphic Design Fundamentals',
      description: 'Get started with graphic design.',
    ),
    StudyMaterial(
      category: 'Designing',
      title: 'UI/UX Design',
      description: 'Learn user interface and user experience design.',
    ),
  ];

  List<StudyMaterial> filteredStudyMaterials = [];

  String selectedCategory = 'Cybersecurity';

  @override
  void initState() {
    super.initState();
    filterStudyMaterials();
  }

  void filterStudyMaterials() {
    setState(() {
      filteredStudyMaterials = studyMaterials
          .where((material) => material.category == selectedCategory)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:const CupertinoNavigationBar(
        middle: Text('Study Material App'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(16.0),
              child: CupertinoPicker(
                itemExtent: 40.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedCategory = studyMaterials[index].category;
                    filterStudyMaterials();
                  });
                },
                children: studyMaterials
                    .map((material) => Text(material.category))
                    .toSet()
                    .toList()
                    .map((category) {
                  return category;
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudyMaterials.length,
                itemBuilder: (context, index) {
                  final material = filteredStudyMaterials[index];
                  return CupertinoListTile(
                    title: Text(material.title),
                    subtitle: Text(material.description),
                    trailing: Icon(CupertinoIcons.right_chevron),
                    onTap: () {
                      
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
}

class StudyMaterial {
  final String category;
  final String title;
  final String description;

  StudyMaterial({
    required this.category,
    required this.title,
    required this.description,
  });
}
