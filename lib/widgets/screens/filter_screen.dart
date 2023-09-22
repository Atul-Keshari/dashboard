// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Scholarship {
//   final String name;
//   final String description;
//   final int minIncome;
//   final String caste;
//   final String state;
//   final double minMarks;

//   Scholarship({
//     required this.name,
//     required this.description,
//     required this.minIncome,
//     required this.caste,
//     required this.state,
//     required this.minMarks,
//   });
// }
// class FilterScreen extends StatefulWidget {
//   @override
//   _FilterScreenState createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   List<Scholarship> scholarships = [
//     Scholarship(
//       name: 'Scholarship 1',
//       description: 'This is Scholarship 1',
//       minIncome: 50000,
//       caste: 'General',
//       state: 'Any',
//       minMarks: 80.0,
//     ),
//     Scholarship(
//       name: 'Scholarship 2',
//       description: 'This is Scholarship 2',
//       minIncome: 30000,
//       caste: 'OBC',
//       state: 'Karnataka',
//       minMarks: 70.0,
//     ),
//     // Add more scholarships as needed
//   ];

//   String selectedCaste = 'General';
//   String selectedState = 'Any';
//   double selectedIncome = 50000.0;
//   double selectedMarks = 80.0;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Scholarship Filter'),
          // leading: CupertinoButton(
          //   padding: EdgeInsets.all(0),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Icon(CupertinoIcons.back),
          // ),
//       ),
//       child: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: <Widget>[
//             CupertinoFormSection(
//               header: Text('Select Caste'),
//               children: <Widget>[
//                 CupertinoSlidingSegmentedControl(
//                   groupValue: selectedCaste,
//                   children: {
//                     'General': Text('General',style: TextStyle(color: Colors.black,fontSize: 18,decoration: TextDecoration.none),),
//                     'OBC': Text('OBC',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                     'SC': Text('SC',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                     'ST': Text('ST',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                   },
//                   onValueChanged: (value) {
//                     setState(() {
//                       selectedCaste = value.toString();
//                     });
//                   },
//                 ),
//               ],
//             ),
//             CupertinoFormSection(
//               header: Text('Select State'),
//               children: <Widget>[
//                 CupertinoPicker(
//                   itemExtent: 40.0,
//                   onSelectedItemChanged: (int index) {
//                     setState(() {
//                       selectedState = [
//                         'Any',
//                         'Karnataka',
//                         'Tamil Nadu',
//                         'Maharashtra'
//                       ][index];
//                     });
//                   },
//                   children: <Widget>[
//                     Text('Any',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                     Text('Karnataka',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                     Text('Tamil Nadu',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                     Text('Maharashtra',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           decoration: TextDecoration.none),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             CupertinoFormSection(
//               header: Text('Enter Family Income',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     decoration: TextDecoration.none),
//               ),
//               children: <Widget>[
//                 CupertinoSlider(
//                   value: selectedIncome,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedIncome = value;
//                     });
//                   },
//                   min: 0,
//                   max: 100000,
//                   divisions: 20,
//                   thumbColor: CupertinoColors.activeBlue,
//                 ),
//                 Text('Income: ₹${selectedIncome.toStringAsFixed(2)}',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       decoration: TextDecoration.none),
//                 ),
//               ],
//             ),
//             CupertinoFormSection(
//               header:const Text('Enter Academic Achievement (Percentage)',
                // style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 18,
                //     decoration: TextDecoration.none),
//               ),
//               children: <Widget>[
//                 CupertinoSlider(
//                   value: selectedMarks,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedMarks = value;
//                     });
//                   },
//                   min: 0,
//                   max: 100,
//                   divisions: 20,
//                   thumbColor: CupertinoColors.activeBlue,
//                 ),
//                 Text('Marks: ${selectedMarks.toStringAsFixed(2)}%',
//                   style:const TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       decoration: TextDecoration.none),
//                 ),
//               ],
//             ),
//             CupertinoButton(
//               onPressed: () {
//                 // Logic to filter scholarships based on selected criteria
//                 List<Scholarship> eligibleScholarships = scholarships
//                     .where((scholarship) =>
//                         scholarship.minIncome <= selectedIncome &&
//                         scholarship.caste == selectedCaste &&
//                         (scholarship.state == selectedState ||
//                             scholarship.state == 'Any') &&
//                         scholarship.minMarks <= selectedMarks)
//                     .toList();

//                 // Display eligible scholarships
//                 showCupertinoDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return CupertinoAlertDialog(
//                       title:const Text('Eligible Scholarships',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             decoration: TextDecoration.none),
//                       ),
//                       content: Column(
//                         children: eligibleScholarships.map((scholarship) {
//                           return Text(
//                             '${scholarship.name}\n${scholarship.description}',
//                             style: TextStyle(fontSize: 16),
//                           );
//                         }).toList(),
//                       ),
//                       actions: <Widget>[
//                         CupertinoDialogAction(
//                           child:const Text('Close',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 decoration: TextDecoration.none),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               color: CupertinoColors.activeBlue,
//               child:const Text('Filter Scholarships',
//                   style: TextStyle(color: CupertinoColors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Scholarship {
  final String name;
  final String description;
  final int minIncome;
  final String caste;
  final String state;
  final double minMarks;

  Scholarship({
    required this.name,
    required this.description,
    required this.minIncome,
    required this.caste,
    required this.state,
    required this.minMarks,
  });
}
class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Scholarship> scholarships = [
    Scholarship(
      name: 'Scholarship 1',
      description: 'This is Scholarship 1',
      minIncome: 50000,
      caste: 'General',
      state: 'Any',
      minMarks: 80.0,
    ),
    Scholarship(
      name: 'Scholarship 2',
      description: 'This is Scholarship 2',
      minIncome: 30000,
      caste: 'OBC',
      state: 'Karnataka',
      minMarks: 70.0,
    ),
    // Add more scholarships as needed
  ];

  String selectedCaste = 'General';
  String selectedState = 'Any';
  double selectedIncome = 50000.0;
  double selectedMarks = 80.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Scholarship Filter'),
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            CupertinoFormSection(
              header:const Text('Select Caste',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              children: <Widget>[
                CupertinoSlidingSegmentedControl(
                  groupValue: selectedCaste,
                  children:const {
                    'General': Text('General',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    'OBC': Text('OBC',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    'SC': Text('SC',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    'ST': Text('ST',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      selectedCaste = value.toString();
                    });
                  },
                ),
              ],
            ),
            // CupertinoFormSection(
            //   header: Text('Select State'),
            //   children: <Widget>[
            //     CupertinoPicker(
            //       itemExtent: 40.0,
            //       onSelectedItemChanged: (int index) {
            //         setState(() {
            //           selectedState = ['Any', 'Karnataka', 'Tamil Nadu', 'Maharashtra'][index];
            //         });
            //       },
            //       children: <Widget>[
            //         Text('Any'),
            //         Text('Karnataka'),
            //         Text('Tamil Nadu'),
            //         Text('Maharashtra'),
            //       ],
            //     ),
            //   ],
            // ),
            CupertinoFormSection(
              header: Text('Select State',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              children: <Widget>[
                CupertinoPicker(
                  itemExtent: 40.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      if (index == 0) {
                        selectedState = 'Any';
                      } else {
                        selectedState = [
                          'Karnataka',
                          'Tamil Nadu',
                          'Maharashtra'
                        ][index - 1];
                      }
                    });
                  },
                  children: <Widget>[
                    Text('Any',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    Text('Karnataka',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    Text('Tamil Nadu',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    Text('Maharashtra',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ],
            ),
            CupertinoFormSection(
              header: Text('Enter Family Income',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              children: <Widget>[
                CupertinoSlider(
                  value: selectedIncome,
                  onChanged: (value) {
                    setState(() {
                      selectedIncome = value;
                    });
                  },
                  min: 0,
                  max: 100000,
                  divisions: 20,
                  thumbColor: CupertinoColors.activeBlue,
                ),
                Text('Income: ₹${selectedIncome.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            CupertinoFormSection(
              header: Text('Enter Academic Achievement (Percentage)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
              children: <Widget>[
                CupertinoSlider(
                  value: selectedMarks,
                  onChanged: (value) {
                    setState(() {
                      selectedMarks = value;
                    });
                  },
                  min: 0,
                  max: 100,
                  divisions: 20,
                  thumbColor: CupertinoColors.activeBlue,
                ),
                Text('Marks: ${selectedMarks.toStringAsFixed(2)}%',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: () {
                // Logic to filter scholarships based on selected criteria
                List<Scholarship> eligibleScholarships = scholarships
                    .where((scholarship) =>
                        scholarship.minIncome <= selectedIncome &&
                        scholarship.caste == selectedCaste &&
                        (scholarship.state == selectedState ||
                            scholarship.state == 'Any') &&
                        scholarship.minMarks <= selectedMarks)
                    .toList();

                // Display eligible scholarships
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Eligible Scholarships',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.none),
                      ),
                      content: Column(
                        children: eligibleScholarships.map((scholarship) {
                          return Text(
                            '${scholarship.name}\n${scholarship.description}',
                            style: TextStyle(fontSize: 16),
                          );
                        }).toList(),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('Close',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              color: CupertinoColors.activeBlue,
              child: Text('Filter Scholarships',
                  style: TextStyle(color: CupertinoColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
