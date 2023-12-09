import 'package:flutter/material.dart';
import 'Products.dart';

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
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        
      ),
    );
  }
}
