import 'package:flutter/material.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({Key? key}) : super(key: key);

  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  final _keyForm = GlobalKey<FormState>();
  final _walletName = TextEditingController();
  final _walletCurrency = TextEditingController();
  final _walletBalance = TextEditingController(text: "0");
  String? _selectedCountryCategory = "in_ID";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "New Wallet",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: _keyForm,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                const SizedBox(height: 16),
                buildTextFormField(_walletName, "Name"),
                const SizedBox(height: 16),
                buildContryCategory(),
                const SizedBox(height: 16),
                buildTextFormField(_walletBalance, "Balance"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Save"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                )
              ],
            ),
          )),
    ));
  }

  Widget buildTextFormField(_controller, label) => TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.toString() == "") {
            return "Wallet $label is empty";
          }
        },
      );

  List<DropdownMenuItem<String>> get categoryCountries {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Indonesia"), value: "in_ID"),
      DropdownMenuItem(child: Text("US"), value: "en_US"),
    ];
    return menuItems;
  }

  Widget buildContryCategory() => DropdownButtonFormField(
        decoration: InputDecoration(
            labelText: "Category", border: OutlineInputBorder()),
        value: _selectedCountryCategory,
        items: categoryCountries,
        onChanged: (String? newValue) {
          setState(() {
            _selectedCountryCategory = newValue;
          });
        },
      );
}
