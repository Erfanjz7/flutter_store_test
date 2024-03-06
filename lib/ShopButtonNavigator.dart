import 'package:flutter/material.dart';
class ShopButtonNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
      child : Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Container(
              height: 50,
              //color: Colors.red,
              width: MediaQuery.of(context).size.width/2-20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.home , color: Colors.white,),
                  Icon(Icons.person , color: Colors.white,),
                ],
              ),
            ),
            Container(
              height: 50,
              //color: Colors.red,
              width: MediaQuery.of(context).size.width/2-20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.search , color: Colors.white,),
                  Icon(Icons.shopping_bag , color: Colors.white,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
