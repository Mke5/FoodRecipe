import 'package:flutter/material.dart';
import 'package:foodrecipe/constants/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        decoration: BoxDecoration(
          color: searchBarColor,
          borderRadius: BorderRadius.circular(25),
        ),

        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search recipes...",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
