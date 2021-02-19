import 'package:diet_controller/interface/food.dart';
import 'package:diet_controller/presentation/components/custom_card.dart';
import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';

class FoodCard extends StatefulWidget {
  final List<Food> food;
  FoodCard(this.food);
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children:_cardGenerator());
  }

  List<Widget> _cardGenerator(){
    final it = widget.food.iterator;
    final list = List<Widget>();
    while (it.moveNext()){
      list.add(
        Container(
          width: MediaQuery.of(context).size.width,
          child:CustomCard(
            padding: EdgeInsets.all(Spacing.normal),
            margin: EdgeInsets.fromLTRB(Spacing.normal, Spacing.small, Spacing.normal, Spacing.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              CustomText(it.current.name)
              ],
            ),
          )
        )
      );
    }
    return list;
  }
  
}