import 'package:erp_system/pdf/pdf_screen.dart';
import 'package:erp_system/screen/add_student.dart';
import 'package:erp_system/screen/detailpage.dart';
import 'package:erp_system/screen/edit_page.dart';
import 'package:erp_system/screen/home_page.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const Erpsystem());
}

class Erpsystem extends StatelessWidget {
  const Erpsystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>const HomePage(),
        '/add':(context)=>const AddStudent(),
        '/detail':(context)=> const Detailpage(),
        '/edit':(context)=>const EditPage(),
        '/pdf':(context)=>const PdfScreen(),
      },
    );
  }
}
