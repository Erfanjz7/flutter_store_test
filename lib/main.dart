import 'dart:convert';
import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Products.dart';
import 'ShopButtonNavigator.dart';
import 'package:http/http.dart';
import 'Products.dart';
import 'Description.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false , home: Store()));
class Store extends StatefulWidget {
  @override
  State<Store> createState() => _StoreState();
}

// class MainMaterial extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Store(),
//     );
//   }
// }


class _StoreState extends State<Store> {
  List<Products> items =[];
  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/json/products.json');
    final data = await json.decode(response);
    setState((){
      for(var i in data){
        print(data);
        var productItem = Products(i['product_name'], i['id'], i['price'], i['image_url'], i['off'], i['description']);
        items.add(productItem);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("فروشگاه" ,
          style : TextStyle(color: Colors.white , fontFamily: "calibri")),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          elevation: 0,
          actions: <Widget>[
            IconButton(onPressed: () {} , icon: Icon(Icons.menu , color: Colors.white,))
          ],
        ),
      body:Padding(
      padding : EdgeInsets.all(15),
        child: GridView.count
        (crossAxisCount: 2 ,
      crossAxisSpacing: 10 ,
      mainAxisSpacing: 5 ,
      children: List.generate(items.length , (int position){
        return generateItems(items[position] , context);
      }),
      ),
    ),
      bottomNavigationBar: ShopButtonNavigator(),
      floatingActionButton: FloatingActionButton(onPressed: () {} , backgroundColor: Colors.amber , child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



Card generateItems(Products product , context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30))
    ),
    elevation: 5,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DescriptionPage(product)
        ));
      },
    child : Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            child: Image.network(
              product.getImageUrl()
            ),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image:
            //         AssetImage('assets/image/Character_Nilou_Full_Wish.png')
            //     )),
          ),
          Text(product.getPrice() ,
          style: TextStyle(
            fontFamily: "calibri",
            color: Colors.lightBlueAccent,
            fontSize: 14.0,
          ),
          ),
          Text(product.getProducName() ,
            style: TextStyle(
              fontFamily: "calibri",
              color: Colors.lightGreen,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    ),
  ),
  );
}


