import 'package:flutter/material.dart';
import 'package:facebookui/Food_Listing/grid_view_widget.dart';
import 'package:facebookui/Food_Listing/list_view_widget.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 225, 247),
          title: const Text(''),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 202, 94, 241),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bars),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 167, 109, 233),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Food List'),
              Tab(text: 'Foods'),
            ],
          ),
          flexibleSpace: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: 400,
                    height: 40,
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 167, 109, 233),
                        ),
                        hintText: 'What Would You Like To Order..?',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(179, 121, 120, 120),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      style: TextStyle(color: Color.fromARGB(255, 75, 1, 1)),
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Color.fromARGB(255, 72, 1, 78),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 229, 230, 230),
        body: TabBarView(
          children: [
            ListViewWidget(),
            GridViewWidget(),
          ],
        ),
      ),
    );
  }
}
