import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _keyForm = GlobalKey<FormState>();
  final _amount = TextEditingController();

  DateTime _now = DateTime.now();

  Future<Null> _selecDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
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

  Widget buildWalletTyte() => TextFormField(
        decoration:
            InputDecoration(labelText: 'Wallet', border: OutlineInputBorder()),
      );

  Widget buildAmount() => TextFormField(
        controller: _amount,
        decoration:
            InputDecoration(labelText: 'Amount', border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
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
            _selecDate(context);
        },
      );

  Widget buildCategory() => TextFormField(
        decoration: InputDecoration(
            labelText: 'Category', border: OutlineInputBorder()),
      );
}
