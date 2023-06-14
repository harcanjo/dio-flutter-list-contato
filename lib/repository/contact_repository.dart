import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/contact_model.dart';


class ContactRepository {
  final String appId = '<YOUR_APP_ID>';
  final String apiKey = '<YOUR_API_KEY>';
  final String baseUrl = '<YOUR_BASE_URL>';

  Future<List<Contact>> getContacts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/classes/Contact'),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      return data.map((contact) => Contact.fromJson(contact)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }

  Future<Contact> createContact(Contact contact) async {
    final response = await http.post(
      Uri.parse('$baseUrl/classes/Contact'),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json',
      },
      body: json.encode(contact.toJson()),
    );

    if (response.statusCode == 201) {
      return Contact.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create contact');
    }
  }

  Future<void> updateContact(String objectId, Contact contact) async {
    final response = await http.put(
      Uri.parse('$baseUrl/classes/Contact/$objectId'),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json',
      },
      body: json.encode(contact.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update contact');
    }
  }

  Future<void> deleteContact(String objectId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/classes/Contact/$objectId'),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete contact');
    }
  }
}
