import 'package:flutter/material.dart';
import 'package:store_app/main.dart';
import 'Products.dart';
import 'main.dart';

class DescriptionPage extends StatelessWidget {
  Products product;
   DescriptionPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description" ,
            style : TextStyle(color: Colors.white , fontFamily: "calibri")),
        centerTitle: true,
        leading: IconButton(
          icon:Icon(
          Icons.arrow_back,
          color: Colors.white ,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Store()
            ));
          },

        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(left: 10 , right: 10),
            child: Text(
              "Shoes",
              style: TextStyle(
                fontFamily: "calibri",
                color: Colors.red,
                fontSize: 40
              ),
            ),
    ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
                product.image_url,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            product.price,
            style: TextStyle(
                fontFamily: "calibri",
                color: Colors.red,
                fontSize: 30,
              height: 2
            ),
          ),
          Text(
            product.productName,
            style: TextStyle(
                fontFamily: "calibri",
                color: Colors.blue,
                fontSize: 20
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45 , right: 45),
            child : Text(
            product.description,
            style: TextStyle(
                fontFamily: "calibri",
                color: Colors.blue,
                fontSize: 20
            ),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
    ),
          Expanded(
              child: Align(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  child: Center(
                    child: Text("افزدون به سبد خرید",
                      style: TextStyle(
                          fontFamily: "calibri",
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width-50,
                  height: 70,
            ),
                ),
            alignment: Alignment.bottomCenter,
           ),
          )
        ],
      ),
    );
  }
}
