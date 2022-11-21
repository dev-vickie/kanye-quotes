import 'package:http/http.dart' as http;
import 'dart:convert';

Future getQuote() async {
  final url = Uri.parse('https://api.kanye.rest/');
  final response = await http.get(url);
  final quotes = jsonDecode(response.body) as Map<String, dynamic>;
  final quote = quotes['quote'];
  return quote;
}