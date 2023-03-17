import 'package:souk_app/Model/Product_Model.dart';
import 'package:souk_app/healper_api/healper.dart';

class UpdateProductServies {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
}) async
  {
    Map<String,dynamic> data=await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,});
    return ProductModel.fromJson(data);
  }
}