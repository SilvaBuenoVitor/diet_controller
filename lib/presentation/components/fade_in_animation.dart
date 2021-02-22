import 'package:flutter/cupertino.dart';

//isolated animator with prebuild tuning knobs
class FadeInAnimation extends StatefulWidget {
  final Widget widget;
  final bool repeat;
  final int duration;
  final Offset offsetBegin;
  final Offset offsetEnd;
  final Curve curve;
  final double rotationBegin;
  final double rotationEnd;
  final Curve rotationCurve;
  FadeInAnimation(this.widget, {this.duration,this.repeat, this.offsetBegin, this.offsetEnd, this.curve, this.rotationBegin, this.rotationEnd, this.rotationCurve});
  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin{
  int _durationTime;
  bool _repeat;
  Offset _offsetBegin;
  Offset _offsetEnd;
  Curve _curve;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    _durationTime = widget.duration;
    _repeat = widget.repeat;
    _offsetBegin = widget.offsetBegin;
    _offsetEnd = widget.offsetEnd;
    _curve = widget.curve;
    if(_repeat!=null && _repeat == true){
      _controller = AnimationController(
        duration: Duration(seconds: _durationTime ?? 2),
        vsync: this, 
      )..repeat(reverse:true); 
    }else{
      _controller = AnimationController(
        duration: Duration(seconds: _durationTime ?? 2),
        vsync: this, 
      )..forward();
    }
    _offsetAnimation = Tween<Offset>(
      begin: _offsetBegin ?? Offset(0.0, -1.5),
      end: _offsetEnd ?? Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _curve ?? Curves.easeOutBack
      )
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: widget.rotationBegin ?? 0.0,end:widget.rotationEnd ?? 0.0).animate(CurvedAnimation(parent: _controller, curve: widget.rotationCurve ?? Curves.linear)),
      child:SlideTransition(
        position: _offsetAnimation,
        child: widget.widget,
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}