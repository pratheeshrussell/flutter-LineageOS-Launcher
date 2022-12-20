// ignore_for_file: file_names

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final Size size;
  final List<ApplicationWithIcon> footerApps;

  const FooterWidget(this.footerApps,this.size, {super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leftSideWidgets(),
      ],
    );
  }

Widget leftSideWidgets(){
  return Container(
    margin:const EdgeInsets.only(left:30,top:25),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        getAppandBuild("AirScreen"),
        getAppandBuild("Android Box Remote")
    ],),
  );
}



Widget getAppandBuild(String name){
 ApplicationWithIcon? app = getApplicationFromName(name);
 if(app == null){
   return Container();
 }
 return  Container(
    margin: const EdgeInsets.only(left:10,right:10),
    child:InkWell(
    onTap: (){launchApp(app.packageName);},
   child:   Image.memory(app.icon,height:35,width:35)
                  )
 );
}


void launchApp(String pkgName){
  DeviceApps.openApp(pkgName);
}

ApplicationWithIcon? getApplicationFromName(String appname){
  ApplicationWithIcon? returner;
  for (ApplicationWithIcon element in footerApps) {
    if(element.appName.toLowerCase().replaceAll(" ", "") == appname.toLowerCase().replaceAll(" ", "")){
            returner = element;
        }
  }
  return returner;
}
  
}