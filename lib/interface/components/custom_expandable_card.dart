import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExpandableCard extends StatefulWidget {
  final Widget collapsedChild;
  final Widget expandedChild;

  const CustomExpandableCard(
      {Key key, this.collapsedChild, this.expandedChild})
      : super(key: key);

  @override
  _CustomExpandableCardState createState() =>
      _CustomExpandableCardState();
}

class _CustomExpandableCardState extends State<CustomExpandableCard> {
  bool isExpanded = false;
  void togle(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
          child: new AnimatedContainer(
          duration: new Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _return(),
        ),
      onPressed: (){togle();},
    );
  }

  Widget _return(){
    return isExpanded ? widget.expandedChild : widget.collapsedChild;
  }
}
