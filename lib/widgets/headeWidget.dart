import 'package:app_settings/app_settings.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class HeaderWidget extends StatelessWidget {
  final Size size;
  final List<ApplicationWithIcon> headerApps;

  const HeaderWidget(this.headerApps,this.size, {super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leftSideWidgets(),
        SizedBox(
          width:size.width * 0.33,
          child:clockWidget()),
        rightSideWidgets()
      ],
    );
  }

Widget leftSideWidgets(){
  return Container(
    margin:const EdgeInsets.only(left:30),
    width:size.width * 0.3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(child: 
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(icon: const Icon(Icons.wifi,size:35), onPressed: (){AppSettings.openWIFISettings();}))),
        
        getAppandBuild("MX Player"),
        getAppandBuild("File Explorer")
    ],),
  );
}

Widget rightSideWidgets(){
  return Container(
    margin:const EdgeInsets.only(right:30),
    width:size.width * 0.3,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        getAppandBuild("Nostalgia.NES Lite"),
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

Widget clockWidget(){
  return DigitalClock(
                  digitAnimationStyle: Curves.elasticOut,
                  areaAligment: AlignmentDirectional.center,
                  is24HourTimeFormat: false,
                  //showSecondsDigit: false,
                  areaDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 50,
                  ),
                  amPmDigitTextStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),              
                );
}

void launchApp(String pkgName){
  DeviceApps.openApp(pkgName);
}

ApplicationWithIcon? getApplicationFromName(String appname){
  ApplicationWithIcon? returner;
  for (ApplicationWithIcon element in headerApps) {
    if(element.appName.toLowerCase().replaceAll(" ", "") == appname.toLowerCase().replaceAll(" ", "")){
        returner = element;
      }
  }
  return returner;
}
  
}