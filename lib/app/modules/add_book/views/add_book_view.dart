import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('addBookView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(children: [
          TextFormField(
            controller: controller.judulController,
            decoration: InputDecoration(hintText: "Masukkan Judul"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Judul tidak boleh kosong";
              }
              return null;
            }),

          TextFormField(
              controller: controller.penulisController,
              decoration: InputDecoration(hintText: "Masukkan Penulis"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Penulis tidak boleh kosong";
                }
                return null;
              }),

          TextFormField(
              controller: controller.penerbitController,
              decoration: InputDecoration(hintText: "Masukkan Penerbit"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Penerbit tidak boleh kosong";
                }
                return null;
              }),

          TextFormField(
              controller: controller.tahunController,
              decoration: InputDecoration(hintText: "Masukkan Tahun Terbit"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tahun Terbit tidak boleh kosong";
                }
                return null;
              }),
          Obx(()=>
          controller.loadingBook.value?
          CircularProgressIndicator():
          ElevatedButton(onPressed: (){
            controller.addBook();
          },
              child: Text("Tambah")))

        ],
        )
    )
    );
  }
}
