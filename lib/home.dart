import 'package:flutter/material.dart';
import 'new_transaction.dart';

class HomeMoneyTracker extends StatelessWidget {
  const HomeMoneyTracker({Key? key}) : super(key: key);

  final _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add new transaction',
          elevation: 2.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> new AddTransaction()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.black12,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: IconButton(
                  icon: Icon(
                    Icons.analytics,
                    color: Colors.black12,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: IconButton(
                  icon: Icon(
                    Icons.flag,
                    color: Colors.black12,
                  ),
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black12,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
    );
  }
}