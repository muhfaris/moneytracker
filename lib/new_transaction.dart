import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/custom/currency.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyForm = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _currencyFormat = NumberFormat("#,##0", "id");

  String? _selectedWallet = "bca";
  String? _selectedCategory = "food";

  DateTime _now = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final _datePicker = await showDatePicker(
        context: context,
        initialDate: _now,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (_datePicker != null && _datePicker != _now) {
      setState(() {
        _now = _datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Add new transaction')),
      body: Form(
        key: _keyForm,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            buildWalletTyte(),
            const SizedBox(height: 16),
            buildAmount(),
            const SizedBox(height: 16),
            buildDate(),
            const SizedBox(height: 16),
            buildCategory(),
            const SizedBox(height: 16)
          ],
        ),
      ),
    ));
  }

  List<DropdownMenuItem<String>> get walletItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("BCA"), value: "bca"),
      DropdownMenuItem(child: Text("Gopay"), value: "gopay"),
    ];
    return menuItems;
  }

  Widget buildWalletTyte() => DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Choose Wallet',
        border: OutlineInputBorder(),
      ),
      value: _selectedWallet,
      onChanged: (String? newValue) {
        setState(() {
          _selectedWallet = newValue;
        });
      },
      items: walletItems);

  Widget buildAmount() => TextFormField(
        controller: _amount,
        decoration:
            InputDecoration(
                prefixText: "Rp ",
                labelText: 'Amount',
                border: OutlineInputBorder()),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyFormat()
        ],
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value.toString() == "0") {
            return 'Your amount is empty';
          }
        },
      );

  Widget buildDate() => TextFormField(
        decoration: InputDecoration(
            labelText: 'Date',
            hintText: DateFormat('yyyy-MM-dd hh:mm').format(_now),
            border: OutlineInputBorder()),
        readOnly: true,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );

  List<DropdownMenuItem<String>> get categoryItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Food"), value: "food"),
      DropdownMenuItem(child: Text("Home"), value: "home"),
    ];
    return menuItems;
  }

  Widget buildCategory() => DropdownButtonFormField(
      decoration:
          InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
      value: _selectedCategory,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCategory = newValue;
        });
      },
      items: categoryItems);
}