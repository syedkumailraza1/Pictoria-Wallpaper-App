import 'package:flutter/material.dart';
import 'package:pictoria/models/apioperations.dart';
import 'package:pictoria/models/photomodel.dart';
import 'package:pictoria/screens/searchscreen.dart';

class SearchWidget extends StatelessWidget {
  
  SearchWidget({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin : EdgeInsets.all(15),
      child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search image',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {},
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen(query: _searchController.text)));
              },
            ),
          ],
        ),
    );
  }
}