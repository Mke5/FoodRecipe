import 'package:flutter/material.dart';
import 'package:foodrecipe/constants/constants.dart';
import 'package:foodrecipe/models/categories_recipe.dart';
import 'package:foodrecipe/models/recipe_models.dart';
import 'package:foodrecipe/widgets/chef_card.dart';
import 'package:foodrecipe/widgets/menu_selector.dart';
import 'package:foodrecipe/widgets/recipe_card.dart';
import 'package:foodrecipe/widgets/search_field.dart';
import 'package:foodrecipe/widgets/section_header.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedMenu = 0;
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackgroundColor,

      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Hello 👋",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            const SearchField(),

            const SizedBox(height: 30),

            const SectionHeader(title: "Popular menus"),

            const SizedBox(height: 15),

            MenuSelector(
              selectedIndex: selectedMenu,
              onTap: (index) {
                setState(() {
                  selectedMenu = index;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipeItems.length,
                itemBuilder: (context, index) {
                  final recipe = recipeItems[index];

                  return RecipeCard(recipe: recipe, index: index);
                },
              ),
            ),

            const SizedBox(height: 40),

            const SectionHeader(title: "Categories"),

            const SizedBox(height: 10),
            categoryItems(),
            const ChefCard(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recipeCategory.length,
          (index) => Padding(
            padding: index == 0
                ? EdgeInsets.only(left: 20, right: 20)
                : EdgeInsets.only(right: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: recipeCategory[index].color,
                  child: Image.asset(
                    recipeCategory[index].image,
                    height: 40,
                    width: 40,
                  ),
                ), // CircleAvatar
                SizedBox(height: 5),
                Text(
                  recipeCategory[index].name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ), // TextStyle
                ), // Text
              ],
            ), // Column
          ), // Padding
        ),
      ), // Row
    );
  }
}
