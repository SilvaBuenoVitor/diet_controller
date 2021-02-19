import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final FloatingActionButton floatingActionButton;
  CustomScaffold(this.body,{this.floatingActionButton});
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
        backgroundColor: UIColors.background,
        appBar: AppBar(
          leading: Icon(Icons.bakery_dining),
          title: CustomText("Diet Controller", color: Colors.white,),
        ),
        body: SingleChildScrollView(
          child: SafeArea(child: widget.body),
        ),
        floatingActionButton: widget.floatingActionButton,
      ),
    );
  }
}