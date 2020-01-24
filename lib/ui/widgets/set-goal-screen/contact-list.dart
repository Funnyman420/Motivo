import 'dart:convert';
import 'package:Motivo/providers/set-goal-state.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'contact-tile.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: setGoalState.messageFriends ? 330 : 0,
        child: FutureBuilder(
          future: setGoalState.messageFriends ? _getContacts() : null,
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text("An error occured"),
                  );
                }

                if (snapshot.data == null)
                  return Center(
                    child: Text("You have to grant permission for contacts"),
                  );
                var contacts = snapshot.data;
                setGoalState.setContacts(contacts);
                return ListView(children: _getContactsList(contacts.toList()));
              default:
                return Center(
                  child: Text("No Contacts"),
                );
            }
          },
        ));
  }

  Future<Iterable<Contact>> _getContacts() async {
    var permissionGranted = await PermissionHandler()
            .checkPermissionStatus(PermissionGroup.contacts) ==
        PermissionStatus.granted;
    if (permissionGranted) {
      return await ContactsService.getContacts();
    }
    return null;
  }

   List<Widget> _getContactsList(List<Contact> contacts) {
    return contacts.map((contact) {
      var encoded = utf8.encode(contact.displayName);
      var decoded = utf8.decode(encoded);
      return ContactListTile(
        decoded: decoded,
        contact: contact,
      );
    }).toList();
  }
}

