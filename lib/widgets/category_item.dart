
import 'package:dashboard/ui/pages/home.dart';
import 'package:dashboard/widgets/screens/filter_screen.dart';
import 'package:dashboard/widgets/screens/help_support.dart';
import 'package:dashboard/widgets/screens/job_opp.dart';
import 'package:dashboard/widgets/screens/metors.dart';
import 'package:dashboard/widgets/screens/study_material.dart';
import 'package:dashboard/widgets/screens/test_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id == 'c5') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else if(id=='c2'){
            Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FilterScreen(),
            ),
          );
        }else if(id=='c1'){
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => StudyMaterialApp(),
            ),
          );
        }
        else if(id=='c3'){
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MentorAssignmentScreen(),
            ),
          );
        } else if (id == 'c4') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => TestAssignmentScreen(),
            ),
          );
        } else if (id == 'c7') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SkillSelectionScreen(),
            ),
          );
        } else if (id == 'c6') {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => OrganizationListScreen(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(color: Colors.black,fontSize: 16,decoration: TextDecoration.none),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Text('This is the Home Screen.'),
      ),
    );
  }
}

