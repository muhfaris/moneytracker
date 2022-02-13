import 'package:flutter/material.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  _ListCategoryState createState() => _ListCategoryState();
}

class Category {
  final String name;
  final String code;
  final String icon;
  final String parent_id;
  Category(this.name, this.code, this.icon, this.parent_id);
}

class _ListCategoryState extends State<ListCategory> {
  final List<Category> _items = [
    Category("Minuman", "minuman",
        "https://img.icons8.com/ios/40/000000/kawaii-coffee.png", ""),
    Category("Makanan", "makanan",
        "https://img.icons8.com/office/40/000000/kawaii-bread-1.png", ""),
    Category("Buah", "buah",
        "https://img.icons8.com/office/40/000000/cherry.png", ""),
    Category("Daging", "daging",
        "https://img.icons8.com/office/40/000000/steak-rare.png", ""),
    Category("Seafood", "seafood",
        "https://img.icons8.com/office/40/000000/crab.png", ""),
    Category("Investment", "investment",
        "https://img.icons8.com/office/40/000000/investment-portfolio.png", ""),
    Category("Salary", "salary",
        "https://img.icons8.com/office/40/000000/receive-cash.png", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white.withOpacity(.10),
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListTile(

        ),
      ),
    ));
  }
}

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;

  RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen two ✌️'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
