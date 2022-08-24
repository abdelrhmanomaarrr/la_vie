
import 'package:flutter/material.dart';

import '../../data/web_services/end_points.dart';

class IthemCard extends StatefulWidget {
 IthemCard({this.title,this.price,this.image});
String? title;
int? price;
String? image;
  @override
  _IthemCardState createState() => _IthemCardState();
}

class _IthemCardState extends State<IthemCard> {
  int itemCounter = 1;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 270,
      width: 150,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 110,
              child: Container(
                width: 80,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                  image: DecorationImage(
                    
                    fit: BoxFit.cover,
                    image: NetworkImage(BASEURL+widget.image!))
                  )
                ),
            ),
            Positioned(
              left: 80,
              top: 78,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if(itemCounter>1)
                        itemCounter--;
                    });

                  },
                  child: Icon(
                    Icons.minimize,
                    size: 25,
                    color: Colors.grey,
                  )),
            ),
            Positioned(
                left: 110,
                top: 83,
                child: Text(
                  '$itemCounter',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Positioned(
              left: 125,
              top: 85,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      itemCounter++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.grey,
                  )),
            ),
            Positioned(
                top: 170,
                left: 10,
                child: Text(
                  widget.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
            Positioned(
                top: 200,
                left: 10,
                child: Text(
                  '${widget.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Positioned(
                top: 225,
                left: 12,
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Color(0xff1ABC00),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}




