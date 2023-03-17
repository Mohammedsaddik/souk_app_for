import 'package:souk_app/Model/Product_Model.dart';
import '../healper_api/healper.dart';

class Categories
{
  Future<List<ProductModel>>getCategoriesProduct({required String CategoryName})async
  {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$CategoryName');
    List <ProductModel> productList=[];
    for(int i=0;i<data.length;i++)
    {
      productList.add(ProductModel.fromJson(data[i],));
    }
    return productList;
  }
}