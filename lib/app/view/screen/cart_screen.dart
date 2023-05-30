
import 'package:e_commerce_app/app/model/product.dart';
import 'package:e_commerce_app/app/provider/cart_provider.dart';
import 'package:e_commerce_app/app/view/widget/cart_item.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Product> _products = Provider.of<CartProvider>(context).allProduct;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 25,),
          Text("${Provider.of<CartProvider>(context).productLength } items available", style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
          SizedBox(height: 12,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _products.length,
            itemBuilder: (context, index) {
                return CartItem(title: _products[index].title, price: _products[index].price, product: _products[index],);
            },
          ),
          SizedBox(height: 48,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub total:", style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                  Text("\$ ${Provider.of<CartProvider>(context).totalPrice}", style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax(15%):", style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                  Text("\$ ${Provider.of<CartProvider>(context).calcTax}", style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:", style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                  Text("\$ ${Provider.of<CartProvider>(context).allPrice}", style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){}, child: Text("Checkout"), style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6A90F2),
                minimumSize: Size(332, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),),
            ],
          ),
        ],
      ),
    );
  }
}

