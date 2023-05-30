import 'package:flutter/material.dart';
import '../../model/product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool productFavoirt = false;
  int _selectedTabBar = 0;

  List<Product> _products = [
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 10.0, favoreit: true),
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 15.0, favoreit: false),
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 30.0, favoreit: false),
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 10.0, favoreit: true),
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 15.0, favoreit: false),
    Product(image: "asset/images/handBag_one.png", title: "HandBag", price: 30.0, favoreit: true),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          bottom: TabBar(
            unselectedLabelStyle: TextStyle(
              color: Color(0xFF9E9DB0),
            ),
            tabs: [
              Tab(child: Text("Kinsa", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Womens", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Handbags", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Boots", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Mens", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Mens", style: TextStyle(color: Color(0xFF474559)),),),
              Tab(child: Text("Mens", style: TextStyle(color: Color(0xFF474559)),),),
            ], isScrollable: true,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              height: 300,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 220 / 198,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTabBar = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F1F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset("asset/images/handBag_three.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(backgroundColor: _selectedTabBar == 0 ? Color(0xFF474459) : Color(0xFFD7D7D7) , borderColor: Color(0xFFD7D7D7), size: 10),
                TabPageSelectorIndicator(backgroundColor: _selectedTabBar == 1 ? Color(0xFF474459) : Color(0xFFD7D7D7), borderColor: Color(0xFFD7D7D7), size: 10),
                TabPageSelectorIndicator(backgroundColor: _selectedTabBar == 2 ? Color(0xFF474459) : Color(0xFFD7D7D7), borderColor: Color(0xFFD7D7D7), size: 10),
              ],
            ),
            SizedBox(height: 32,),
            GridView.builder(
              shrinkWrap: true,
              itemCount: _products.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 360,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/product_detailes", arguments: _products[index]);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(_products[index].image),
                            Positioned(child: IconButton(icon: Icon(Icons.favorite), onPressed: () {
                              setState(() {
                                _products[index].favoreit = !_products[index].favoreit;
                              });
                            }, color: _products[index].favoreit ? Colors.red : Colors.grey,), top: 0, right: 0,),
                          ],
                        ),
                        Text(_products[index].title),
                        SizedBox(height: 12,),
                        Text("${_products[index].price}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
