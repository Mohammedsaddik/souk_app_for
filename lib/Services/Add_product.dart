import 'package:souk_app/Model/Product_Model.dart';
import 'package:souk_app/healper_api/healper.dart';

class AddProductServies {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category})async {
    Map<String,dynamic> data=await Api().post(url: 'https://fakestoreapi.com/products', body: {
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category,
      },);
    return ProductModel.fromJson(data);
  }
}