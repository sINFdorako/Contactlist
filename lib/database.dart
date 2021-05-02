import 'package:firebase_database/firebase_database.dart';
import 'newContact.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveContact(Contact contact) {
  var id = databaseReference.child('contacts/').push();
  id.set(contact.toJson());
  return id;
}

Future<List<Contact>> getAllContacts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('contacts/').once();
  List<Contact> contacts = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Contact contact = createContact(value);
      contact.setId(databaseReference.child('contacts/' + key));
      contacts.add(contact);
    });
  }
  return contacts;
}
