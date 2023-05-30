import 'package:e_commerce_app/app/model/product.dart';
import 'package:e_commerce_app/app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {

  final String title;
  final double price;
  final Product product;

  CartItem({
    Key? key,
    required this.title,
    required this.price,
    required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("asset/images/handBag_one.png", width: 70,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$this.title", style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
            Text('from boots category', style: GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontSize: 14
            ),),
            Text("\$ ${this.price}", style: GoogleFonts.quicksand(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Provider.of<CartProvider>(context, listen: false).removeProduct(product);
            }, icon: Icon(Icons.delete)),
          ],
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
