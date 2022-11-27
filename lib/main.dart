import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyTabBar(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {

  late TabController _tabcontroller;

  @override
  void initState(){
    _tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                borderRadius: BorderRadius.circular(
                  3
                )
              ),
              child: TabBar(
                controller: _tabcontroller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    3.0,
                  ),
                  color: Colors.purple[900],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Select 1',

                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Select 2',
                    ),

                    Tab(
                      text: 'Select 3',
                    ),
                  ],
              ),
            ),
            Expanded(
                child: TabBarView(
                  controller: _tabcontroller,
                  children: [
                    Center(
                      child: Text(
                        'First Tab'
                      ),
                    ),
                    Center(
                      child: Text(
                        'Second Tab'
                      ),
                    ),
                    Center(
                      child: Text(
                          'Second Tab'
                      ),
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
