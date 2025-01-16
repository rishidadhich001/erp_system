import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: primary,
        leading: Icon(
          Icons.menu,
          color: bgcolor,
        ),
        title: Text(
          'ERP System',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: bgcolor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        backgroundColor: primary,
        child: Icon(
          Icons.add,
          color: bgcolor,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            listindex=index;
            Navigator.of(context).pushNamed('/detail');
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            // width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: secondary),
            child: Row(
                children: [
                  const SizedBox(width: 10,),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: bgcolor,
                    shape: BoxShape.circle,
                    border: Border.all(color: black),
                  image: DecorationImage(image: studentlist[index]['image']==null?NetworkImage(img):MemoryImage(studentlist[index]['image']),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10,),
                child: VerticalDivider(
                  thickness: 1.5,
                  color: bgcolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      studentlist[index]['id'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: black),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      studentlist[index]['name'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: black),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      studentlist[index]['course'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: black),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        itemCount: studentlist.length,
      ),
    );
  }
}
