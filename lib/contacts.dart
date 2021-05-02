import 'package:contactlist/newContact.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactSite extends StatefulWidget {
  @override
  _ContactSiteState createState() => _ContactSiteState();
}

class _ContactSiteState extends State<ContactSite> {
  List<Contact> contactList = <Contact>[];

  void updateContacts() {
    getAllContacts().then((contacts) => {
          this.setState(() {
            this.contactList = contacts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updateContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meine Kontakte'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    '${contactList[index].prename}',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${contactList[index].surname}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.mail),
                    color: Colors.blueAccent,
                    hoverColor: Colors.blueAccent,
                    splashColor: Colors.blueAccent,
                    iconSize: 40,
                    onPressed: () {
                      UrlLauncher.launch('mailto:${contactList[index].mail}');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.phone),
                    color: Colors.greenAccent,
                    hoverColor: Colors.greenAccent,
                    splashColor: Colors.greenAccent,
                    iconSize: 40,
                    onPressed: () {
                      UrlLauncher.launch(
                          'tel:${contactList[index].phonenumber}');
                    },
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black54,
          height: 15,
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newContact');
        },
        tooltip: 'Kontakt Hinzufügen',
        child: Icon(Icons.add),
      ),
    );
  }
}
