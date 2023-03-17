import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:souk_app/Services/Add_product.dart';

class addProductScreen extends StatefulWidget {
  @override
  State<addProductScreen> createState() => _addProductScreenState();
}
class _addProductScreenState extends State<addProductScreen> {
  String? ProductName, decs, images;
  String? category = 'default';
  String? priceproduct;
  bool IsLoading=false;
  @override
  Widget build(BuildContext context)
  {
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Add Product',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23.0),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                    decs = data;
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
                    priceproduct = data;
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
                    images = data;
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
                    onPressed: ()async {
                      IsLoading=true;
                      setState(() {

                      });
                      try{
                        await AddProduct();
                        print('success');
                      }catch(e){
                        print(e.toString());
                      }
                      IsLoading=false;
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

  Future<void> AddProduct()async {
    await AddProductServies().addProduct(
      title: ProductName!,
      price: priceproduct!,
      desc: decs!,
      image: images!,
      category: category!,
    );
  }
}
