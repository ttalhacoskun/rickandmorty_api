import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rickandmorty_api/model/character.dart';
import 'package:http/http.dart' as http;


class MainViewModel with ChangeNotifier{
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

List<Character> _characters =[];

List<Character> get characters => _characters;

MainViewModel(){
  WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    _getCharacters();
  });
}

void _getCharacters () async{
  Uri uri = Uri.parse(_apiUrl);
  http.Response response = await http.get(uri);

 // List<dynamic> allCharacters = jsonDecode(response.body);

  Map<String, dynamic> allCharacters = jsonDecode(response.body);

  List<Map<String, dynamic>> characters = List<Map<String, dynamic>>.from(allCharacters['results']);


  for (Map<String, dynamic> characterMap in characters){
    Character character = Character.fromMap(characterMap);
    _characters.add(character);
  }
  notifyListeners();
}

}