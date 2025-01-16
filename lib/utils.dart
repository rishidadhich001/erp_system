import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

Color bgcolor=const Color(0xffFFF0DC);
Color secondary=const Color(0xffF0BB78);
Color black=const Color(0xff131010);
Color primary=const Color(0xff543A14);

TextEditingController textID =TextEditingController(text:'1001');
TextEditingController textName =TextEditingController(text: 'Rishi Dadhich');
TextEditingController textage =TextEditingController(text: '21');
TextEditingController textcourse =TextEditingController(text: 'flutter');
TextEditingController textphone =TextEditingController(text: '9825198350');
TextEditingController textaddress =TextEditingController(text: 'B-601 gokuldham app');

List studentlist=[];

int listindex=0;
String img='https://tse3.mm.bing.net/th?id=OIP.abbHwUGf7cWF1KrClYxa5AHaHa&pid=Api&P=0&h=180';
Uint8List? photo;