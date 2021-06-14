import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class MainCarouselSlider extends StatelessWidget {
  final Size size;
  final List<ApplicationWithIcon> sliderAssets;

  MainCarouselSlider(this.sliderAssets,this.size);


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliderAssets.length,
      options: CarouselOptions(
        height: size.height * 0.45,
        aspectRatio: 16 / 9,
        viewportFraction: 0.5,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (context, index) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
                onTap: (){
                  launchApp(sliderAssets[index].packageName);
                },
                  child: Card(              
                  child: Container(
                    width:size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(                      
                          margin: EdgeInsets.only(bottom:20),
                          height:100,width:100,
                          child: Image.memory(sliderAssets[index].icon,fit: BoxFit.fill,)),
                        Text(sliderAssets[index].appName,style:TextStyle(color:Colors.black,fontSize: 25,
                        fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                  
                  ),
            );
          },
        );
      },
    );
  }

void launchApp(String pkgName){
  DeviceApps.openApp(pkgName);
}
}