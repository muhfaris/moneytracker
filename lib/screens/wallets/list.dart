import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytracker/screens/wallets/add.dart';

class ListWallet extends StatefulWidget {
  const ListWallet({Key? key}) : super(key: key);

  @override
  _ListWalletState createState() => _ListWalletState();
}

class Wallet {
  final String name;
  final String currency;
  final double balance;

  Wallet(this.name, this.currency, this.balance);
}

class _ListWalletState extends State<ListWallet> {
  List<Wallet> _items = [
    Wallet("Gopay", "in_ID", 90000),
    Wallet("BCA", "in_ID", 200000),
    Wallet("Ovo", "IDR", 800000),
    Wallet("Shopee Pay", "IDR", 900),
    Wallet("Shopee2 Pay", "IDR", 900),
    Wallet("Shopee3 Pay", "IDR", 900),
    Wallet("Shopee4 Pay", "IDR", 900),
    Wallet("Shopee5 Pay", "IDR", 900),
    Wallet("Shopee6 Pay", "IDR", 900),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset:true,
          backgroundColor: Colors.white.withOpacity(.95),
            appBar: AppBar(
              title: Text(
                "Wallets",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
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
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> new AddWallet()),
                      );
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      var item = _items[index];
                      return ListTile(
                          title: Text(item.name),
                          leading: Container(
                            height: 47,
                            width: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          subtitle:
                              buildFormatCurrency(item.currency, item.balance),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Text("edit"),
                                  onTap: (){},
                                ),
                                PopupMenuItem(
                                  value: "delete",
                                  child: Text("delete"),
                                  onTap: (){},
                                )
                              ];
                            },
                            //onSelected: (String value) => actionPopUpItemSelected(value, name),
                          ));
                    },
                  ),
                ),
              ),
            ),
        ));
  }

  Widget buildFormatCurrency(currency, balance) => Text(
        NumberFormat.simpleCurrency(locale: currency).format(balance),
      );
}
