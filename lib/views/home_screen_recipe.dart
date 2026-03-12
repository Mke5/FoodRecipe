import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodrecipe/constants/constants.dart';
import 'package:foodrecipe/models/recipe_models.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0;
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.bar_chart_rounded,
    Icons.favorite,
    Icons.person_outline_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            const SizedBox(height: 30),
            searchField(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular menus",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ), // TextStyle
                  ), //Text
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ), // TextStyle
                  ), //Text
                ],
              ), // Row
            ), // Padding
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    menuItems.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                selectedIndex == index
                                    ? Colors.green
                                    : Colors.white,
                                selectedIndex == index
                                    ? Colors.greenAccent
                                    : Colors.white,
                              ],
                            ), // LinearGradient
                          ), // BoxDecoration
                          child: Text(
                            menuItems[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ), // Container
                      ), // GestureDetector
                    ), // Padding
                  ), // List.Generate
                ],
              ), // Row
            ), // SingleChildScrollView
          ],
        ), // Column
      ), // SafeArea
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: searchBarColor,
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search recipes...",
            hintStyle: TextStyle(color: Colors.black26),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            prefixIcon: Icon(Icons.search, color: Colors.black45),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Hello, \n", style: TextStyle(fontSize: 16)),
                  TextSpan(
                    text: "What do you want to eat today?",
                    style: TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://static.vecteezy.com/system/resources/thumbnails/032/176/191/small/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg",
                ),
              ),
              const Positioned(
                right: 1,
                top: 1,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
