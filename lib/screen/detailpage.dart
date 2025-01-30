import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';
class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        },
          icon: const Icon(Icons.arrow_back),
          color: bgcolor,
        ),
        actions: [
          IconButton(onPressed: () {
            textID = TextEditingController(text: studentlist[listindex]['id']);
            textName = TextEditingController(text: studentlist[listindex]['name']);
            textage = TextEditingController(text: studentlist[listindex]['age']);
            textphone = TextEditingController(text: studentlist[listindex]['phone']);
            textcourse = TextEditingController(text: studentlist[listindex]['course']);
            textaddress = TextEditingController(text: studentlist[listindex]['address']);
            Navigator.of(context).pushNamed('/edit');
          }, icon:  Icon(Icons.edit,color: bgcolor,)),
          IconButton(onPressed: () {
            studentlist.removeAt(listindex);
            Navigator.of(context).pushReplacementNamed('/');
          }, icon:  Icon(Icons.delete,color:bgcolor,),),
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('/pdf');
          }, icon: Icon(Icons.picture_as_pdf,color: bgcolor,)),
        ],
        title: Text(
          'Detail Page',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: bgcolor),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: bgcolor,
                shape: BoxShape.circle,
                border: Border.all(color: black),
            image: DecorationImage(image: studentlist[listindex]['image']==null?NetworkImage(img):MemoryImage(studentlist[listindex]['image'])),
            ),
          ),
          ListTile(
            leading: Icon(Icons.numbers,color: primary,),
            title: Text(studentlist[listindex]['id'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.person,color: primary,),
            title: Text(studentlist[listindex]['name'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.call,color: primary,),
            title: Text(studentlist[listindex]['phone'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month,color: primary,),
            title: Text(studentlist[listindex]['age'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.school,color: primary,),
            title: Text(studentlist[listindex]['course'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
          ListTile(
            leading: Icon(Icons.home,color: primary,),
            title: Text(studentlist[listindex]['address'],style: TextStyle(color: black,fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}
