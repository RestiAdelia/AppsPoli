import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormMahasiswa extends StatefulWidget {
  const FormMahasiswa({super.key});

  @override
  State<FormMahasiswa> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FormMahasiswa> {
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController notlpn = TextEditingController();
  TextEditingController alamat = TextEditingController();

  String? valjurusan, valprodi, inputForm;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('For Register', style: TextStyle(fontSize: 10)),
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'NIM',
                  controller: nim,
                  hintText: '223****',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Nama',
                  controller: nama,
                  hintText: 'Resti',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'No Telephone',
                  controller: notlpn,
                  hintText: '08*****',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),
                CostumeInput(
                  labelInput: 'Alamat',
                  controller: alamat,
                  hintText: '08*****',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 13),

                SizedBox(height: 15),
                Text("Pilih Jurusan", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valjurusan,
                    underline: Container(),
                    isExpanded: true,
                    items:
                    [
                      'TI',
                      "Mesin",
                      "Elektro",
                      "Sipil",
                      "ADM ",
                      "Bahasa Inggris",
                    ].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valjurusan = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 18),
                Text('Prodi ', style: TextStyle(fontSize: 18)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Flexible(
                      child: CostumeRadio(
                        groupValue: valprodi.toString(),
                        value: 'Mi',
                        onChanged: (val) {
                          setState(() {
                            valprodi = val;
                          });
                        },
                      ),
                    ),
                    Flexible(
                        child: CostumeRadio(
                            groupValue: valprodi.toString(),
                            value: 'Tekom',
                            onChanged: (val){
                              setState(() {
                                valprodi = val;
                              });
                            })
                    ),
                    Flexible(
                        child: CostumeRadio(
                            groupValue: valprodi.toString(),
                            value: 'Sipil',
                            onChanged: (val){
                              setState(() {
                                valprodi = val;
                              });
                            })
                    ),
                    Flexible(
                        child: CostumeRadio(
                            groupValue: valprodi.toString(),
                            value: 'Trpl',
                            onChanged: (val){
                              setState(() {
                                valprodi = val;
                              });
                            })
                    ),
                  ],
                ),
                SizedBox(height: 18),
                CostumButton(
                  bgColor: Colors.red,
                  labelColor: Colors.white,
                  labelButton: "Save",
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        //cek input agama dan jk
                        if (valjurusan != null && valprodi != null) {
                          inputForm = "NIM : ${nim.text}\n"
                              "Nama : ${nama.text}\n"
                              "No Telphone : ${notlpn.text}\n"
                              "Alamat : ${alamat.text}\n"
                              "Jurusan : ${valjurusan.toString()}\n"
                              "Prodi : ${valprodi.toString()}\n";
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(inputForm.toString()))
                          );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Silahkan Pilih Jurusan dan Dan Prodi"))
                          );
                        }
                      }
                    });
                  },
                  // labelColor: Colors.white,
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
        Text(labelInput, style: TextStyle(fontSize: 18)),
        TextFormField(
          controller: controller,
          validator: (val) {
            return val!.isEmpty ? 'Input tidak boleh kosong' : null;
          }, // berfungsi untuk memproses input -> mengambil data dari input
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          keyboardType: textInputType,
          obscureText: obscureText,
          onTap: () {
            onTap?.call();
          },
        ),
      ],
    );
  }
}

class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const CostumeRadio({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val) {
          if (val != null) {
            onChanged(val);
          }
        },
        title: Text(value),
      ),
    );
  }
}

class CostumButton extends StatelessWidget {
  final Color bgColor;
  final String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CostumButton({
    super.key,
    required this.bgColor,
    required this.labelColor,
    required this.labelButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: bgColor,
        ),
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor)),
      ),
    );
  }
}