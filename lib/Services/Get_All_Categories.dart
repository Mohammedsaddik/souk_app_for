
import 'package:souk_app/healper_api/healper.dart';

class AllCategories
{
  Future<List<dynamic>>getAllCategories()async
  {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}