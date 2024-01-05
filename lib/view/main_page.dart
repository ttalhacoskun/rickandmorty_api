import 'package:flutter/material.dart';
import 'package:rickandmorty_api/model/character.dart';
import 'package:rickandmorty_api/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _buildCharactersList(context),
    );
  }
}
Widget _buildCharactersList(BuildContext context){
  return SafeArea(
    child: Column(
      children: [
        Image.asset("Assets/Rickandmorty.png",
        scale: 2,),
        Consumer<MainViewModel>(builder: (context,viewModel,child)=>
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.characters.length,
            itemBuilder: (context,index){
              Character character = viewModel.characters[index] as Character;
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.yellow
                  ),
                ),
                color: Colors.greenAccent,
                child: ListTile(
                  title: Text(character.name),
                  subtitle: Text(character.location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(character.image),
                  ),   
                )
              );
            },
          ),
        )
        ),
      ],
    ),
  );
}