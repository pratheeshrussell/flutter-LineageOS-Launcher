import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final Size size;
  final List<ApplicationWithIcon> footerApps;

  FooterWidget(this.footerApps,this.size);


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftSideWidgets(),
        ],
      )
    );
  }

Widget leftSideWidgets(){
  return Container(
    margin:EdgeInsets.only(left:30,top:25),
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
 ApplicationWithIcon app = getApplicationFromName(name);
 if(app == null){
   return Container();
 }
 return  Container(
    margin: EdgeInsets.only(left:10,right:10),
    child:InkWell(
    onTap: (){launchApp(app.packageName);},
   child:   Image.memory(app.icon,height:35,width:35)
                  )
 );
}


void launchApp(String pkgName){
  DeviceApps.openApp(pkgName);
}

ApplicationWithIcon getApplicationFromName(String appname){
  ApplicationWithIcon returner;
  footerApps.forEach((element) {
    if(element.appName.toLowerCase().replaceAll(" ", "") == appname.toLowerCase().replaceAll(" ", "")){
            returner = element;
        }
  });
  return returner;
}
  
}