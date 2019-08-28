import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../details_page.dart';
import '../home_page.dart';

class HomeItem extends StatelessWidget {
  final ShoeModel shoeModel;

  HomeItem({this.shoeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: shoeModel.bgColor, borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => DetailsPage(shoeModel: shoeModel,)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Text(
                  "${shoeModel.modelNumber}",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.1),
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 12.0,
                ),
                Positioned(
                  top: 10.0,
                  bottom: 10.0,
                  right: 15.0,
                  left: 15.0,
                  child: Transform.rotate(
                    angle: -100,
                    child: Image(
                      image: AssetImage(shoeModel.shoeImage),
                      fit: BoxFit.scaleDown,
                      height: 250.0,
                      width: 250.0,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(
                      shoeModel.shoeName,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "\$ ${shoeModel.originalPrice}",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "\$ ${shoeModel.discountedPrice}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
