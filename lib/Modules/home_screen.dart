import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souk_app/Model/Product_Model.dart';
import 'package:souk_app/Modules/add_product_screen.dart';
import 'package:souk_app/Services/Get_All_Product.dart';
import 'package:souk_app/Widgets/Custom_Card.dart';
class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>addProductScreen()));
              },
              icon: const FaIcon(
                FontAwesomeIcons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 75.0),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProduct().getAllProduct(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
            {
              List<ProductModel>products=snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100
                  ),
                  itemBuilder: (context,index)
                  {
                    return CustomCard(product: products[index],);
                  }
              );
            }else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
