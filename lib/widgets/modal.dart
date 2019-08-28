import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Modal {
  mainBottomSheet(
      BuildContext context, String shoeName, int price, String image) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Transform.rotate(
                            angle: -100,
                            child: Image(
                              image: AssetImage(image),
                              fit: BoxFit.scaleDown,
                              height: 200.0,
                              width: 200.0,
                            )),
                      ),

                      Expanded(
                        flex: 1
                        ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(shoeName, textAlign: TextAlign.right,style: TextStyle(color: Colors.grey,fontSize: 18.0, fontWeight: FontWeight.bold),),
                            SizedBox(height: 8.0,),
                            Text("\$$price", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0),
                  Divider(height: 2.0,color: Colors.grey.withOpacity(0.5),),
                  SizedBox(height: 16.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.directions_walk, color: Colors.grey,),
                      Text(" SELECT SIZE", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    ],
                  ),

                  SizedBox(height: 16.0),

                  Row(
                    children: <Widget>[

                      _buildSizedContainer("US 6", 1),
                      _buildSizedContainer("US 7", 2),
                      _buildSizedContainer("US 9", 3),
                      _buildSizedContainer("US 9.5", 4),
                      _buildSizedContainer("US 10", 5),

                    ],
                  ),

                  SizedBox(height: 32.0),
                  Container(
                    height: 80.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                     color: Colors.grey,
                      borderRadius: BorderRadius.circular(40.0)
                    ),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                          Icon(Icons.add_shopping_cart, color: Colors.white, size: 32.0,),
                        Text("ADD TO CART", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildSizedContainer(String title, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.grey)),
        child: InkWell(

          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

}
