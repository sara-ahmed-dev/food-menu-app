import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
         centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white ,fontSize: 25,fontWeight: FontWeight.bold, ),
           backgroundColor: Colors.deepPurple,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white, iconSize: 26,),
            actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,size: 24, ),
        ),],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10,10),),)
      ),
    );
  }
}

