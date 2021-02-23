
import 'package:diet_controller/interface/components/wave_widget.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final AppBar appBar;
  final Widget body;
  final FloatingActionButton floatingActionButton;
  final Widget bottomNavigationBar;
  CustomScaffold(this.body,{this.floatingActionButton,this.appBar, this.bottomNavigationBar});
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: UIColors.background,
        appBar: widget.appBar ?? null,
        body: Stack(
          children:[
            Container(
            height: MediaQuery.of(context).size.height/2.5,
            width: MediaQuery.of(context).size.width,
            color: UIColors.background,
          ),
          AnimatedPositioned(
            child: WaveWidget(
              size: MediaQuery.of(context).size,
              yOffset: MediaQuery.of(context).size.height/3,
            ), 
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
          ),
          SafeArea(child: widget.body),
          ]
        ),
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}