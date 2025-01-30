import 'package:erp_system/screen/add_student.dart';
import 'package:erp_system/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get studentsList => null;

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = false;
              });
            },
            icon: Icon(
              Icons.refresh,
              color: bgcolor,
            ),
          ),
        ],
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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: textbox(label: 'Search', txtController: textSearch)),
              IconButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < studentlist.length; i++) {
                      if (studentlist[i]['id'] == textSearch.text) {
                        search = studentlist[i];
                      }
                    }
                    isSearch = true;
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          isSearch
              ? GestureDetector(
                  onTap: () {
                    // listindex = index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: bgcolor,
                              border: Border.all(color: black, width: 1.5),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: search['image'] == null
                                      ? NetworkImage(img)
                                      : MemoryImage(search['image']))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: VerticalDivider(
                            color: bgcolor,
                            thickness: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                search['id'],
                                style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              Text(
                                search['name'],
                                style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  search['course'],
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        listindex = index;
                        Navigator.of(context).pushNamed('/detail');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: bgcolor,
                                  border: Border.all(color: black, width: 1.5),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: studentlist[index]['image'] == null
                                          ? NetworkImage(img)
                                          : MemoryImage(
                                              studentlist[index]['image']))),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: VerticalDivider(
                                color: bgcolor,
                                thickness: 1.5,
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
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                  Text(
                                    studentlist[index]['name'],
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      studentlist[index]['course'],
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: studentlist.length,
                  ),
                ),
        ],
      ),
    );
  }
}
