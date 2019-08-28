import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_animation/details_page.dart';
import 'package:nike_animation/widgets/home_list_item.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<ShoeModel> shoesList = List<ShoeModel>();

  ShoeModel shoe1;
  ShoeModel shoe2;
  ShoeModel shoe3;
  ShoeModel shoe4;

  @override
  void initState() {
    super.initState();
    shoe1 = ShoeModel(
        shoeName: "AIR MAX 90, EX BLACK",
        originalPrice: 299,
        discountedPrice: 200,
        modelNumber: 90,
        shoeImage: "assets/airmax_90.png",
        bgColor: Colors.grey.withOpacity(0.2));

    shoe2 = ShoeModel(
      shoeName: "AIR MAX 250, GOLD",
      originalPrice: 299,
      discountedPrice: 200,
      modelNumber: 250,
      shoeImage: "assets/shoe_4.png",
      bgColor: Colors.redAccent.withOpacity(0.2),
    );
    shoe3 = ShoeModel(
      shoeName: "AIR MAX 100, PURPLE",
      originalPrice: 299,
      discountedPrice: 200,
      modelNumber: 100,
      shoeImage: "assets/shoe_2.png",
      bgColor: Colors.orange.withOpacity(0.2),
    );
    shoe4 = ShoeModel(
      shoeName: "AIR MAX 181, GOLD",
      originalPrice: 299,
      discountedPrice: 200,
      modelNumber: 181,
      shoeImage: "assets/shoe_3.png",
      bgColor: Colors.lightBlueAccent.withOpacity(0.2),
    );
  }

  void _changeTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.asset(
          "assets/img_logo.png",
          height: 20.0,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              HomeItem(shoeModel: shoe1),
              HomeItem(shoeModel: shoe2),
              HomeItem(shoeModel: shoe3),
              HomeItem(shoeModel: shoe4),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('')),
          BottomNavigationBarItem(
              icon: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              title: new Text(''))
        ],
        onTap: (index) {
          _changeTab(index);
        },
      ),
    );
  }
}

class ShoeModel {
  String shoeName;
  int originalPrice;
  int discountedPrice;
  int modelNumber;
  String shoeImage;
  Color bgColor;

  ShoeModel(
      {this.shoeName,
      this.originalPrice,
      this.discountedPrice,
      this.modelNumber,
      this.shoeImage,
      this.bgColor});
}
