import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:galaxy_planets/screens/home_screen/HController/home_controller.dart';
import 'package:galaxy_planets/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  HController con = Get.put(HController());
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pri,
        appBar: AppBar(
          title: Text("treva"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: g1,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: con.planet_name.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    //data
                    InkWell(
                      onTap: () {
                        Data(con.png_loc[index], con.planet_name[index],
                            con.Planet_data[index], con.p_gre[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                              offset: Offset(2, 3),
                            ),
                          ],
                          color: sec,
                        ),
                        padding: EdgeInsets.only(left: 55,top: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${con.planet_name[index]}",
                              style: TextStyle(color: txt, fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            Text(
                              "Milkyway Galaxy",
                              style: TextStyle(color: Colors.grey,),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      child: AnimatedBuilder(
                        animation: animationController,
                        child: Image.asset("${con.png_loc[index]}",height: 65,width: 65,),
                        builder: (BuildContext context, Widget? _widget) {
                          return Transform.rotate(
                            angle: animationController.value,
                            child: _widget,
                          );
                        },
                      ),
                    ),
                    //remove
                  ],
                ),
              );
            }),
      ),
    );
  }

  void Data(String Img_link, String planet_name, String p_data, String p_gre) {
    Get.defaultDialog(
      title: planet_name,
      titleStyle: TextStyle(color: txt, fontWeight: FontWeight.bold),
      backgroundColor: pri,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(top: 60),
                height: 120,
                decoration: BoxDecoration(
                  color: sec,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/pngs/ic_distance.png",
                      color: txt,
                      height: 15,
                      width: 15,
                    ),
                    Text(
                      "${p_gre}",
                      style: TextStyle(color: txt),
                    ),
                  ],
                ),
              ),
              //Img
              // AnimatedContainer(
              //   duration: Duration(seconds: 2),
              //   curve: Curves.bounceOut,
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     "${Img_link}",
              //     height: 100,
              //     width: 100,
              //   ),
              // ),
              Container(
                alignment: Alignment.center,

                child: AnimatedBuilder(
                  animation: animationController,
                  child: Image.asset("${Img_link}",height: 100,width: 100,),
                  builder: (BuildContext context, Widget? _widget) {
                    return Transform.rotate(
                      angle: animationController.value,
                      child: _widget,
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
              height: 200,
              child: SingleChildScrollView(
                child: Text(
                  "\n${p_data}",
                  style: TextStyle(color: txt),
                ),
              )),
        ],
      ),
    );
  }
}
