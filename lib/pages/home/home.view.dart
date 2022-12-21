// ignore_for_file: library_private_types_in_public_api

import 'package:flutterLineageOSLauncher/widgets/carousalSlider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutterLineageOSLauncher/widgets/footerWidget.dart';
import 'package:flutterLineageOSLauncher/widgets/headeWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ApplicationWithIcon> mediaApps = [];
  List<ApplicationWithIcon> headerApps = [];
  List<ApplicationWithIcon> footerApps = [];

  @override
  void initState() {
    getApps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height:_size.height,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildHeaderApps(_size),
              buildMediaApps(_size),
              buildFooterApps(_size)
            ],
          ),
      ),
      
     
    
    );
  }

  Widget buildHeaderApps(Size size){
    return Container(
      height: size.height * 0.25,
      width: size.width,
      alignment: Alignment.topCenter,
      child: HeaderWidget(headerApps,size)
    );
  }

  Widget buildMediaApps(Size size){
    if(mediaApps.isEmpty){
      return Container();
    }

    return Container(
      height: size.height * 0.5,width: size.width,
      margin: const EdgeInsets.only(left:20,right:20),
      child: MainCarouselSlider(mediaApps,size)
    );
   }

  
  Widget buildFooterApps(Size size){
    return Container(
      height: size.height * 0.25,
      width: size.width,
      alignment: Alignment.topCenter,
      child: FooterWidget(footerApps,size)
    );
  }

  Future<void> getApps() async {
    List<ApplicationWithIcon> apps = (await DeviceApps.getInstalledApplications(
       includeAppIcons: true)).toList().cast();
       
    List<String> _mediaApps = ["YouTube", "Prime Video","Netflix","Hotstar","Plex","Crackle free movies and tv shows"];
    List<String> _headerApps = ["MX Player", "File Explorer","Nostalgia.NES Lite"];
    List<String> _footerApps = ["AirScreen", "Android Box Remote"];
    
    for (ApplicationWithIcon element in apps) {
      for (String mediaString in _mediaApps) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            mediaApps.add(element);
        }
      }

      for (String mediaString in _headerApps) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            headerApps.add(element);
        }
      }

       for (String mediaString in _footerApps) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            footerApps.add(element);
        }
      }

      // print("-------------");
      // print(element.appName);
      // print("-------------");
    
    
    }
    setState(() {});
  }
}
