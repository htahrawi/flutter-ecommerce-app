import 'package:e_commerce_app/app/model/product.dart';
import 'package:e_commerce_app/app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/product.dart';


class ProductDetailes extends StatefulWidget {
  ProductDetailes({Key? key}) : super(key: key);

  @override
  State<ProductDetailes> createState() => _ProductDetailesState();
}

class _ProductDetailesState extends State<ProductDetailes> {
  @override
  Widget build(BuildContext context) {

    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite), color: product.favoreit ? Colors.red : Colors.grey.shade500,),
          ),
          Image.asset("asset/images/handBag_one.png", width:double.infinity, fit: BoxFit.contain),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${product.title}", style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Text("${product.price}", style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
          SizedBox(height: 5,),
          Text("Bags", style: GoogleFonts.roboto(
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),),
          SizedBox(height: 20,),
          Divider(
            color: Color(0xFFE8E8E8),
            indent: 10,
            endIndent: 10,
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of types", style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color(0xFF9393A7),
            ),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade100, width: 3),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Provider.of<CartProvider>(context, listen: false).addProduct(product);
            }, child: Text("ADD TO CART"), style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
