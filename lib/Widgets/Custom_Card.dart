
import 'package:flutter/material.dart';
import 'package:souk_app/Model/Product_Model.dart';
class CustomCard extends StatelessWidget
{
  CustomCard({required this.product});
  late final ProductModel product;
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context,'/update', arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40.0,
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.0,
                offset: Offset(10, 10),
              )
            ]),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      product.title.substring(0,11),
                      style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children:
                      [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32.0,
            top: -60.0,
            child: Image.network(
              product.image,
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}