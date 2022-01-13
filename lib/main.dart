// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MoneyTracker());
}

class MoneyTracker extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Money Tracker',
      home: new HomeMoneyTracker(),
    );
  }
}