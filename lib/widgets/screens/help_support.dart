import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Organization {
  final String name;
  final String description;
  final String contact;

  Organization({
    required this.name,
    required this.description,
    required this.contact,
  });
}

List<Organization> dummyOrganizations = [
  Organization(
    name: 'NGO 1',
    description: 'Helping underprivileged students in need.',
    contact: 'contact@ngo1.org',
  ),
  Organization(
    name: 'NGO 2',
    description: 'Supporting education for the less fortunate.',
    contact: 'contact@ngo2.org',
  ),
  // Add more NGOs and patrons
];

class OrganizationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('NGOs & Patrons'),
      ),
      child: ListView.builder(
        itemCount: dummyOrganizations.length,
        itemBuilder: (context, index) {
          final organization = dummyOrganizations[index];
          return CupertinoListTile(
            title: Text(
              organization.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            subtitle: Text(
              organization.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => OrganizationDetailScreen(organization),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrganizationDetailScreen extends StatelessWidget {
  final Organization organization;

  OrganizationDetailScreen(this.organization);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          organization.name,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              decoration: TextDecoration.none),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 8),
            Text(
              organization.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 16),
            Text(
              'Contact:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 8),
            Text(
              organization.contact,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
