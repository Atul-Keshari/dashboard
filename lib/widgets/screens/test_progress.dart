import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Test {
  final String subject;
  final String grade;
  final List<String> questions;
  final List<String> correctAnswers;
  List<String> userAnswers;
  double score;

  Test({
    required this.subject,
    required this.grade,
    required this.questions,
    required this.correctAnswers,
    required this.userAnswers,
    this.score = 0,
  });
}

class TestAssignmentApp extends StatelessWidget {
  const TestAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: TestAssignmentScreen(),
    );
  }
}

class TestAssignmentScreen extends StatefulWidget {
  const TestAssignmentScreen({super.key});

  @override
  _TestAssignmentScreenState createState() => _TestAssignmentScreenState();
}

class _TestAssignmentScreenState extends State<TestAssignmentScreen> {
  String selectedGrade = 'Class 10';
  String selectedSubject = 'Mathematics';

  List<Test> tests = [
    Test(
      subject: 'Mathematics',
      grade: 'Class 10',
      questions: [
        'Question 1: What is 2 + 2?',
        'Question 2: What is 5 - 3?',
        // Add more questions
      ],
      correctAnswers: ['4', '2'],
      userAnswers: [],
      score: 0,
    ),
    // Add more tests for different subjects
  ];

  @override
  void initState() {
    super.initState();
    // Initialize selected tests
    filterTests();
  }

  // Function to filter tests based on selected grade and subject
  void filterTests() {
    setState(() {
      tests = tests
          .where((test) =>
              test.grade == selectedGrade && test.subject == selectedSubject)
          .toList();
    });
  }

  // Function to calculate and set the score for the selected test
  void calculateScore(Test test) {
    double totalQuestions = test.questions.length.toDouble();
    double correctAnswers = 0;

    for (int i = 0; i < test.questions.length; i++) {
      if (test.userAnswers[i] == test.correctAnswers[i]) {
        correctAnswers++;
      }
    }

    test.score = (correctAnswers / totalQuestions) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Test Assignment'),
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
                    selectedGrade = ['Class 9', 'Class 10', 'Class 11'][index];
                    filterTests();
                  });
                },
                children: ['Class 9', 'Class 10', 'Class 11'].map((grade) {
                  return Text(grade);
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: CupertinoPicker(
                itemExtent: 40.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedSubject =
                        ['Mathematics', 'Science', 'History'][index];
                    filterTests();
                  });
                },
                children: ['Mathematics', 'Science', 'History'].map((subject) {
                  return Text(subject);
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tests.length,
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return Card(
                    child: Column(
                      children: [
                        Text(
                          'Subject: ${test.subject}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        for (var i = 0; i < test.questions.length; i++)
                          Column(
                            children: [
                              Text(test.questions[i]),
                              CupertinoTextField(
                                placeholder: 'Your Answer',
                                onChanged: (value) {
                                  test.userAnswers[i] = value;
                                },
                              ),
                            ],
                          ),
                        CupertinoButton(
                          onPressed: () {
                            calculateScore(test);
                            showResultDialog(test);
                          },
                          child: Text('Submit'),
                        ),
                        if (test.score > 0)
                          Text('Score: ${test.score.toStringAsFixed(1)}%'),
                      ],
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

  void showResultDialog(Test test) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Test Result'),
          content: Text('Score: ${test.score.toStringAsFixed(1)}%'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
