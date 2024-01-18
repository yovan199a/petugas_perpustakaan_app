import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaaan_app/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Get.toNamed(Routes.ADD_BOOK),
        ),
        body: controller.obx((state) =>
            ListView.separated(itemBuilder: (context, index){
              return ListTile(
                title: Text(state[index].judul??"-"),
                subtitle: Text('Penulis ${state[index].penulis ?? "-"}'),
              );
            },separatorBuilder: (context, index){
              return Divider();
            },
                itemCount: state!.length
            ))
    );
  }
}
