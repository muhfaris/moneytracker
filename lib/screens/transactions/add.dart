import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/widgets/currency.dart';
import 'package:moneytracker/screens/categories/add.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyForm = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _descriptions = TextEditingController();

  String? _selectedTransactionType = "income";
  String? _selectedWallet = "bca";
  String? _selectedCategory = "food";
  int? _incomeExpense = 1;

  late DateTime _selectedDate = DateTime.now();
  final _dateController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final _datePicker = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 20));

    if (_datePicker != null && _datePicker != _selectedDate) {
      setState(() {
        _selectedDate = _datePicker;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
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
            buildTransactionTypes(),
            const SizedBox(height: 16),
            buildWalletTyte(),
            const SizedBox(height: 16),
            buildAmount(),
            const SizedBox(height: 16),
            buildDescription(),
            const SizedBox(height: 16),
            buildDate(),
            const SizedBox(height: 16),
            buildCategory(),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text("submit", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                // if(_keyForm.currentState.validate()){}
              },
            ),
          ],
        ),
      ),
    ));
  }

  List<DropdownMenuItem<String>> get transactionTypes {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Income"), value: "income"),
      DropdownMenuItem(child: Text("Expense"), value: "expense"),
      DropdownMenuItem(child: Text("Transfer"), value: "transfer"),
    ];
    return menuItems;
  }

  Widget buildTransactionTypes() => DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Choose Transaction',
        border: OutlineInputBorder(),
      ),
      value: _selectedTransactionType,
      onChanged: (String? newValue) {
        setState(() {
          _selectedTransactionType = newValue;
        });
      },
      items: transactionTypes);

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
        decoration: InputDecoration(
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

  Widget buildDescription() => TextField(
        controller: _descriptions,
        decoration: InputDecoration(
          labelText: "Descriptions",
          border: OutlineInputBorder(),
          hintText: "write note",
        ),
        keyboardType: TextInputType.multiline,
      );

  Widget buildDate() => TextFormField(
        controller: _dateController,
        decoration: InputDecoration(
            labelText: 'Date',
            hintText: DateFormat('yyyy-MM-dd hh:mm').format(_selectedDate),
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
      DropdownMenuItem(
          child: Text(
            "+ New category",
            style: new TextStyle(
              color: Colors.green,
            ),
          ),
          value: "new_category"),
    ];
    return menuItems;
  }

  Widget buildCategory() => DropdownButtonFormField(
      decoration:
          InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
      value: _selectedCategory,
      onChanged: (String? newValue) {
        if (newValue == "new_category") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new AddCategory()),
          );
        }

        setState(() {
          _selectedCategory = newValue;
        });
      },
      items: categoryItems);

  Widget buildRadio(String title, int value) => ListTile(
        contentPadding: const EdgeInsets.only(left: 1, right: 1),
        title: Text(title),
        leading: Radio<int>(
          groupValue: _incomeExpense,
          value: value,
          onChanged: (int? value) {
            setState(() {
              _incomeExpense = value;
            });
          },
        ),
      );

  Widget buildIncomeExpense() => ListTile(
        title: Text("Transaction Type"),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(child: buildRadio("Income", 1)),
              Expanded(child: buildRadio("Expense", 2)),
              Expanded(child: buildRadio("Transfer", 2))
            ],
          ),
        ),
      );
}
