import 'package:diet_controller/cubit/meal_cubit.dart';
import 'package:diet_controller/cubit/meal_state.dart';
import 'package:diet_controller/interface/food.dart';
import 'package:diet_controller/interface/meal.dart';
import 'package:diet_controller/presentation/components/custom_bottom_navigation_bar.dart';
import 'package:diet_controller/presentation/components/custom_card.dart';
import 'package:diet_controller/presentation/components/custom_scaffold.dart';
import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/presentation/components/horizontal_spacing.dart';
import 'package:diet_controller/presentation/components/vertical_spacing.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealScreen extends StatefulWidget {
  @override
  _MealScreenState createState() => _MealScreenState();
}

//meal screen, showing details about meals and foods
class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(Spacing.normal),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText("Refeições", fontSize: FontSize.huge,color: UIColors.primary,)
                  ],
                ),
                //cubit consumer for state treatment
                BlocConsumer<MealCubit, MealState>(
                  builder: (context, state){
                    if(state is MealInitial){
                      return CircularProgressIndicator();
                    } else if(state is MealLoaded){
                      return _mealScreenCards(state.meal,context);
                    }else if(state is MealLoading){
                      return CustomText("OIE???");
                    }else if (state is MealError){
                      return CustomText("Banana Azul mesml");
                    } 
                    return CustomText("QUE???");
                  }, 
                  listener: (context, state){
                    if(state is MealError){
                      Scaffold.of(context).showSnackBar(SnackBar(content: CustomText("Erro ao buscar alimentos, a internet está ativa?")));
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(0,context),
    );
  }
}

//meal cards isolation, construction and display of multiple instances of meal
Widget _mealScreenCards(List<Meal> list, context){
  List<Widget> _auxiliarList = List<Widget>();
  final it = list.iterator;
  while(it.moveNext()){
    _auxiliarList.addAll([
      VerticalSpacing(),
      Row(children: [
          Expanded(child: CustomText(it.current.time.format(context), color: UIColors.secondary,fontSize: FontSize.big,),flex: 2,),
          Expanded(child: Divider(color: UIColors.secondary,thickness: 2,),flex: 8,),
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: CustomCard(
          child: Column(
            children: [
              VerticalSpacing(spacing: Spacing.small,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HorizontalSpacing(spacing: Spacing.medium,),
                  ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: SizedBox(width: 40, height: 40, child: Icon(Icons.bakery_dining,color: Colors.black38,)),
                    ),
                  ),
                  HorizontalSpacing(spacing: Spacing.small,),
                  CustomText(it.current.name,fontSize: FontSize.big,bold: true,),
                ],
              ),
              _mealItens(it.current.foods),
              VerticalSpacing(spacing: Spacing.small,),
            ],
          ),
        ),
      )
    ]);
  }
  return Column(children: _auxiliarList,);
}

//treatment and display of multiple food instances
Widget _mealItens(List<Food> foods){
  final it = foods.iterator;
  final List<Widget> _auxList = new List<Widget>();
  while(it.moveNext()){
    _auxList.addAll([
      Row(children: [
        HorizontalSpacing(spacing: Spacing.huge,),
        Icon(Icons.arrow_right_alt_outlined),
        CustomText(it.current.name),
      ],)
    ]);
  }
  return Column(children: _auxList,);
}