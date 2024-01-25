import 'package:flutter/material.dart';

class InviteMembersPage extends StatefulWidget {
  @override
  _InviteMembersPageState createState() => _InviteMembersPageState();
}

class _InviteMembersPageState extends State<InviteMembersPage> {
  TextEditingController _searchController = TextEditingController();
  List<Contact> _data = [
    Contact(name: 'Were Samson', phoneNumber: '123-456-7890',circleColor: Colors.blue),
    Contact(name: 'Kossi ADANOU', phoneNumber: '987-654-3210',circleColor: Colors.black12),
    Contact(name: 'Nkui Loh', phoneNumber: '555-123-4547',circleColor: Colors.red),
    Contact(name: 'Mishek', phoneNumber: '555-123-4561',circleColor: Colors.green),
    Contact(name: 'Maku', phoneNumber: '555-123-4560',circleColor: Colors.redAccent),
    Contact(name: 'Senior Francois', phoneNumber: '555-123-4560',circleColor: Colors.redAccent),
    Contact(name: 'Senior Suad', phoneNumber: '555-123-4560',circleColor: Colors.redAccent),
    Contact(name: 'Senior Akweley', phoneNumber: '555-123-4560',circleColor: Colors.redAccent),
    Contact(name: 'Senior Jude', phoneNumber: '555-123-4560',circleColor: Colors.redAccent),
    // Add more contacts as needed
  ];
  List<Contact> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _data
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()) ||
              contact.phoneNumber.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite members to tontine'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: TextFormField(
              controller: _searchController,
              onChanged: _filterData,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search contacts...',
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _filteredData[index].circleColor),
                    title: Text(_filteredData[index].name),
                    subtitle: Text(_filteredData[index].phoneNumber),
                    trailing: Text("Invite"),
                    // You can customize the list item as needed
                  );
                },
                separatorBuilder: (context, index)=> Divider(),
                ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  String name;
  String phoneNumber;
  Color circleColor;
  Contact({required this.name, required this.phoneNumber,required this.circleColor});
}
