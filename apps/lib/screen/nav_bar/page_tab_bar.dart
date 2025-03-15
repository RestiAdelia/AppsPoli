import 'package:apps/screen/latihan_form/form_mahasiswa.dart';
import 'package:apps/screen/nav_bar/page_grid_view.dart';
import 'package:apps/screen/nav_bar/page_register.dart';
import 'package:flutter/material.dart';

class PageTabBar extends StatefulWidget {
  const PageTabBar({super.key});

  @override
  State<PageTabBar> createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar> with SingleTickerProviderStateMixin {
  //inisialisai object

  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Tab Bar", style: TextStyle(color :Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),
      body: TabBarView(
        controller: tabController,
          children: [
           PageRegister(),
            PageGridView()],

      ),

      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
            tabs: [
          Tab(text: ("Register"),icon: Icon(Icons.input),),
          Tab(text: ("Grid View"),icon: Icon(Icons.grid_on),),
          Tab(text: ("List View"),icon: Icon(Icons.list),),
        ]
        ),
      ),
    );
  }
}
