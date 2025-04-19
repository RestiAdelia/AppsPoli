import 'package:flutter/material.dart';
class PageSerachList extends StatefulWidget {
  const PageSerachList({super.key});

  @override
  State<PageSerachList> createState() => _PageSerachListState();
}

class _PageSerachListState extends State<PageSerachList> {

  List<String> listDevice =[
    "iphone",
    "Samsung",
    "Xiomi",
    "Oppo",
    "Vivo",
    "Realme",
    "Apple",
    "ipad",
    "Tablet",
    "Motorola"
  ];

  bool isCari =true;
  List<String> filterData =[];
  TextEditingController txtCari =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
