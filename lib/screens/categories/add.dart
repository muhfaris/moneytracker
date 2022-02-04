import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _keyForm = GlobalKey<FormState>();
  final _categoryName = TextEditingController();
  String? _selectedParentCategory = "-";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("New Category")),
            body: Form(
              key: _keyForm,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  buildCategoryName(),
                  const SizedBox(height: 16),
                  buildParentCategory(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: Text("save", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      // go back
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )));
  }

  Widget buildCategoryName() => TextFormField(
        controller: _categoryName,
        decoration: InputDecoration(
          labelText: "Category Name",
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.toString() == "") {
            return "Category name is empty";
          }
        },
      );

  List<DropdownMenuItem<String>> get parentCategoryItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Makanan"), value: "makanan"),
      DropdownMenuItem(child: Text("Minuman"), value: "minuman"),
      DropdownMenuItem(child: Text("-"), value: "-"),
    ];
    return menuItems;
  }

  Widget buildParentCategory() => DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: "Choose Parent Category",
          border: OutlineInputBorder(),
        ),
        value: _selectedParentCategory,
        onChanged: (String? newValue) {
          setState(() {
            _selectedParentCategory = newValue;
          });
        },
        items: parentCategoryItems,
      );
}
