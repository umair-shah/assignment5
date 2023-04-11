import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MediaQuery(
        data: MediaQueryData(),
        child: Scaffold(
          body: Container(
            child: RecipePage(),
          ),
        ),
      ),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  child: Text('Help'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildRecipeCard(
            'assets/images/bread.jpg',
            'Fresh Baked Bread',
          ),
          _buildRecipeCard(
            'assets/images/taco.jpg',
            'Tacos',
          ),
          _buildRecipeCard(
            'assets/images/salad.jpg',
            'Salads',
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(String imagePath, String title) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          imagePath,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('Save Recipe'),
              ),
              PopupMenuItem(
                child: Text('Share Recipe'),
              ),
            ];
          },
        ),
      ),
    );
  }
}
