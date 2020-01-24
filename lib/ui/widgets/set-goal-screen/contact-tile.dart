import 'package:Motivo/providers/set-goal-state.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListTile extends StatelessWidget {
    const ContactListTile({
    @required this.decoded,
    @required this.contact
  });

  final String decoded;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    return CheckboxListTile(
      title: Text(decoded),
      secondary: (contact.avatar != null && contact.avatar.length > 0)
          ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar))
          : CircleAvatar(child: Text(contact.initials())),
      value: setGoalState.selectedContacts[contact],
      onChanged: (value) {
        setGoalState.onContactSelected(contact, value);
      },
    );
  }
}