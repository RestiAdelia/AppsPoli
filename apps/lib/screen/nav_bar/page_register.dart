import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tanggallahir = TextEditingController();
  TextEditingController password = TextEditingController();

  // Fungsi untuk memilih tanggal
  Future<void> selectDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (pickDate != null) {
      setState(() {
        tanggallahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Form Register",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                CostumeInput(
                  labelInput: "Full Name",
                  controller: fullname,
                  hintText: "Resti Addelia",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CostumeInput(
                  labelInput: "Username",
                  controller: username,
                  hintText: "Restii",
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                CostumeInput(
                  labelInput: "Email",
                  controller: email,
                  hintText: "Resti@gmail.com",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CostumeInput(
                  labelInput: "Tanggal Lahir",
                  controller: tanggallahir,
                  hintText: "06 Januari 2005",
                  textInputType: TextInputType.datetime,
                  onTap: () => selectDate(), // Panggil DatePicker
                ),
                SizedBox(height: 10),
                CostumeInput(
                  labelInput: "Password",
                  controller: password,
                  hintText: "******",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true, // Sembunyikan teks
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({
    super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? "Input tidak boleh kosong" : null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          obscureText: obscureText, // Menggunakan properti yang benar
          readOnly: onTap != null, // Agar tidak bisa diketik jika pakai onTap
          onTap: onTap, // Panggil fungsi jika ada onTap
        ),
      ],
    );
  }
}
