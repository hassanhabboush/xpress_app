import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoadBrController extends GetxController{

  Future<void> loadData() async{
    var response =  await http.get(Uri.parse('https://sallah.hexacit.com/api/getProductsByCategoryId/1'));

    print(response.body);
  }

}