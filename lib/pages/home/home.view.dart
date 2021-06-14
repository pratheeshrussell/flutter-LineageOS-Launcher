import 'package:flutterLineageOSLauncher/widgets/carousalSlider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutterLineageOSLauncher/widgets/footerWidget.dart';
import 'package:flutterLineageOSLauncher/widgets/headeWidget.dart';

class MyHomePage extends StatefulWidget {
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
      body:  Container(
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
    if(mediaApps.length < 1){
      return Container();
    }

    return Container(
      height: size.height * 0.5,width: size.width,
      margin: EdgeInsets.only(left:20,right:20),
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
    List<Application> apps = await DeviceApps.getInstalledApplications(
       includeAppIcons: true);
       
    List<String> _mediaApps = ["YouTube", "Prime Video","Netflix","Hotstar","Plex","Crackle free movies and tv shows"];
    List<String> _headerApps = ["MX Player", "File Explorer","Nostalgia.NES Lite"];
    List<String> _footerApps = ["AirScreen", "Android Box Remote"];
    apps.forEach((element) {
      _mediaApps.forEach((mediaString) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            mediaApps.add(element);
        }
      });

      _headerApps.forEach((mediaString) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            headerApps.add(element);
        }
      });

       _footerApps.forEach((mediaString) {
        if(element.appName.toLowerCase().replaceAll(" ", "") == mediaString.toLowerCase().replaceAll(" ", "")){
            footerApps.add(element);
        }
      });

      // print("-------------");
      // print(element.appName);
      // print("-------------");
    
    
    });
    setState(() {});
  }
}
