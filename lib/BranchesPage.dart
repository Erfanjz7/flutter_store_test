import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/Branch.dart';


import 'main.dart';
    class BranchesPage extends StatefulWidget {
      const BranchesPage({super.key});

      @override
      State<BranchesPage> createState() => _BranchesPageState();
    }

    class _BranchesPageState extends State<BranchesPage> {
      Set<Marker> _branchesList = {};
      Completer<GoogleMapController> _controller = Completer();
      void onComplete(GoogleMapController controller){
        _controller.complete();
      }
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPoints();
  }

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
          body: GoogleMap(
            onMapCreated: onComplete,
            markers: _branchesList,
            initialCameraPosition: CameraPosition(
              target: LatLng(35.694672221301566, 51.374157428682864),
              zoom: 6
            ),
          ),
        );
      }
      Future<void> fetchPoints() async{
        var points_json = await rootBundle.loadString('assets/json/branches.json');
        final datas = await json.decode(points_json);
        setState((){
          for (var points in datas){
            var b = Branch(points['shop_name'] , points['id'] , points['tel'] , points['lat'] , points['lng'] , points['manager']);
            print(b);
            Marker marker = Marker(
                markerId: MarkerId(b.id.toString()),
              position: LatLng(b.lat , b.lng),
              infoWindow: InfoWindow(
                title: b.name ,
                snippet: b.manager
              )
            );
            _branchesList.add(marker);
          }
        });
      }
    }
