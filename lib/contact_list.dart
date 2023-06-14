import 'package:flutter/material.dart';

import 'model/contact_model.dart';

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'Fake Name 1',
        email: 'fake1@example.com',
        phoneNumber: '123456789',
        photoPath: ''),
    Contact(
        name: 'Fake Name 2',
        email: 'fake2@example.com',
        phoneNumber: '123456789',
        photoPath: ''),
    Contact(
        name: 'Fake Name 3',
        email: 'fake3@example.com',
        phoneNumber: '123456789',
        photoPath: ''),
    Contact(
        name: 'Fake Name 4',
        email: 'fake4@example.com',
        phoneNumber: '123456789',
        photoPath: ''),
    Contact(
        name: 'Fake Name 5',
        email: 'fake5@example.com',
        phoneNumber: '123456789',
        photoPath: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            trailing: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                // TODO: Navegar para pagina de detalhes do contato
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Navegar para pagina de cadastro
        },
      ),
    );
  }
}
