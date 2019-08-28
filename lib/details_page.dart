import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nike_animation/home_page.dart';
import 'package:nike_animation/widgets/modal.dart';
import 'package:nike_animation/widgets/slider_item.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class DetailsPage extends StatefulWidget {
  final ShoeModel shoeModel;

  DetailsPage({this.shoeModel});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _selectedIndex;

  void _handleSize(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Modal modal = Modal();
  int _current = 0;
  List<String> sliderList = List<String>();

  @override
  void initState() {
    super.initState();

    sliderList = [
      "assets/shoe_3.png",
      "assets/shoe_4.png",
      "assets/shoe_2.png",
      "assets/airmax_90.png"
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset(
          "assets/img_logo.png",
          height: 20.0,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: widget.shoeModel.bgColor,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${widget.shoeModel.modelNumber}",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.1),
                                        fontWeight: FontWeight.bold),
                                    textScaleFactor: 15.0,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              child: CarouselSlider(
                                items: sliderList.map((sliderItem) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return SliderItem(
                                        image: sliderItem,
                                      );
                                    },
                                  );
                                }).toList(),
                                onPageChanged: (index) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                autoPlay: true,
                                viewportFraction: 1 / 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 10.0,
                        left: 10.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: sliderList.isNotEmpty
                                ? map<Widget>(sliderList, (index, url) {
                                    return Container(
                                      width: 5.0,
                                      height: 5.0,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == index
                                              ? Colors.black
                                              : Colors.grey.withOpacity(0.4)),
                                    );
                                  })
                                : []),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.shoeModel.shoeName,
                                textScaleFactor: 2.0,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "\$ ${widget.shoeModel.originalPrice}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18.0),
                                  ),
                                  Text(
                                    "\$ ${widget.shoeModel.discountedPrice}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        Text(
                          "AVAILABLE SIZES",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        SizedBox(height: 22.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildSizedContainer("US 6", 1),
                            _buildSizedContainer("US 7", 2),
                            _buildSizedContainer("US 9", 3),
                            _buildSizedContainer("US 9.5", 4),
                            _buildSizedContainer("US 10", 5),
                          ],
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        Text(
                          "DESCRIPTION",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "The Air Max 250 shoes is inspired by Nike",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 16.0,
            left: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0)
                  ),

                    child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black87,
                        ),
                        onPressed: () {},
                        iconSize: 32.0)),

                Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40.0)
                    ),

                    child: IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () => modal.mainBottomSheet(context, widget.shoeModel.shoeName, widget.shoeModel.discountedPrice,widget.shoeModel.shoeImage),
                        iconSize: 32.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizedContainer(String title, int index) {
    return Expanded(
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(25.0)),
        child: InkWell(
          onTap: () {
            _handleSize(index);
          },
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
