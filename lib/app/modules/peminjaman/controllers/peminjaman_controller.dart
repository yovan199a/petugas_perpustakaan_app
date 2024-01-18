import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaaan_app/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaaan_app/app/data/model/response_pinjam.dart';
import 'package:petugas_perpustakaaan_app/app/data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future <void> getData() async{
    change(null, status: RxStatus.loading());
    try{
      final response = await ApiProvider.instance().get(Endpoint.pinjam);
      if(response.statusCode == 200){
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
        if(responsePinjam.data!.isEmpty){
          change(null, status: RxStatus.empty());
        }else{
          change(responsePinjam.data,status: RxStatus.success());
        }
      }else{
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    }on DioException catch(e){
      change(null, status: RxStatus.error("Error ${e.message}"));
    }catch(e){
      change(null, status: RxStatus.error("Error : $e"));
    }
  }
}
