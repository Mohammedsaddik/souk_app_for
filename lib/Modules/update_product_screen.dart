import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:souk_app/Model/Product_Model.dart';
import 'package:souk_app/Services/Update_Product.dart';

class UpdateScreen extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? ProductName, dec, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute
        .of(context)!
        .settings
        .arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Update Product',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23.0),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:
            [
              const SizedBox(height: 100.0,),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 30.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    ProductName = data;
                  },
                  decoration: InputDecoration(
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    dec = data;
                  },
                  decoration: InputDecoration(
                      hintText: 'Description',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  decoration: InputDecoration(
                      hintText: 'Price',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  onChanged: (data) {
                    image = data;
                  },
                  decoration: InputDecoration(
                      hintText: 'Image',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0)
                  ),
                  width: double.infinity,
                  child: MaterialButton(
                    child: const Text('Update', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),),
                    onPressed: ()async
                    {
                      isLoading=true;
                      setState(() {
                      });
                      try
                      {
                        await updateProduct(product);
                        print('success');
                      }catch(error){
                        print(error.toString());
                      }
                      isLoading=false;
                      setState(() {
                      });
                    },
                    color: Colors.blue,
                    splashColor: Colors.black,
                    height: 55.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
    await UpdateProductServies().updateProduct(
      title:ProductName==null?product.title: ProductName!,
      price:price==null?product.price.toString(): price!,
      desc:dec==null?product.description: dec!,
      image:image==null?product.image: image!,
      category: product.category,
      id: product.id,);
  }
}
