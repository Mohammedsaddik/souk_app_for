
import 'package:souk_app/healper_api/healper.dart';
import '../Model/Product_Model.dart';
class AllProduct
{
  Future<List<ProductModel>>getAllProduct()async
  {
    List<dynamic> data =await Api().get(url:'https://fakestoreapi.com/products');
    List <ProductModel> productList=[];
    for(int i=0;i<data.length;i++)
    {
      productList.add(ProductModel.fromJson(data[i],));
    }
    return productList;
  }
}