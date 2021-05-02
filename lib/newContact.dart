import 'package:contactlist/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Contact {
  String prename = '';
  String surname = '';
  String phonenumber = '';
  String mail = '';
  late DatabaseReference _id;

  Contact();

  Map<String, dynamic> toJson() => {
        'prename': this.prename,
        'surname': this.surname,
        'phonenumber': this.phonenumber,
        'mail': this.mail
      };

  void setId(DatabaseReference id) {
    this._id = id;
  }
}

Contact createContact(record) {
  Map<String, dynamic> attributes = {
    'prename': '',
    'surname': '',
    'phonenumber': '',
    'mail': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  Contact contact = new Contact();
  contact.prename = attributes['prename'];
  contact.surname = attributes['surname'];
  contact.phonenumber = attributes['phonenumber'];
  contact.mail = attributes['mail'];

  return contact;
}

class NewContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neuen Kontakt erstellen')),
      body: PageView.builder(
        itemBuilder: (_, i) {
          return Expanded(
              child: Column(
            children: [
              SizedBox(height: 25),
              new Image.asset('images/icon_man_blue.png', height: 150),
              ContactForm(),
              SizedBox(height: 25),
            ],
          ));
        },
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  Contact contactSave = Contact();

  var _prename = new TextEditingController();
  var _surname = new TextEditingController();
  var _phonenumber = new TextEditingController();
  var _mail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _prename,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Vorname',
              ),
              keyboardType: TextInputType.name,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[a-zA-ZüÜöÖäÄ]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _surname,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nachname',
              ),
              keyboardType: TextInputType.name,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[a-zA-ZüÜöÖäÄ]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _phonenumber,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Telefonnummer',
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[+0-9]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _mail,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'E-Mail',
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[@.a-zA-Z]'))
              ],
            ),
          ),
          SizedBox(height: 40),
          new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: save,
              padding: EdgeInsets.all(16.0),
              color: Color.fromRGBO(0, 160, 227, 1),
              textColor: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child:
                    Text("Kontakt Speichern", style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void save() {
    setState(() {
      contactSave.prename = _prename.text;
      contactSave.surname = _surname.text;
      contactSave.phonenumber = _phonenumber.text;
      contactSave.mail = _mail.text;
    });

    saveContact(contactSave);
    Navigator.pushNamed(context, '/main');
  }
}
