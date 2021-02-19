import 'package:diet_controller/cubit/login_cubit.dart';
import 'package:diet_controller/presentation/components/custom_card.dart';
import 'package:diet_controller/presentation/components/custom_flat_button.dart';
import 'package:diet_controller/presentation/components/custom_text_montserrat.dart';
import 'package:diet_controller/presentation/components/vertical_spacing.dart';
import 'package:diet_controller/utils/route_constants.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      body: Padding(
        padding: EdgeInsets.all(Spacing.normal),
        child:Column(
          children: [
            new Spacer(),
             BlocConsumer<LoginCubit, LoginState>(
              builder: (context, state) {
                if(state is LoginInitial){
                  return card(false);
                } else if(state is LoginFailed){
                  return card(false);
                }else if(state is LoginSuccess){
                  Future.delayed(Duration.zero,()=>Navigator.pushReplacementNamed(context, KRoutes.splashScreen));
                }
                return card(true);
              }, 
              listener: (context, state) {
                if(state is LoginError){
                  Scaffold.of(context).showSnackBar(SnackBar(content: CustomText("Algo deu errado")));
                  return card(false);
                }
              },
            ),
            Row(children: [
              Expanded(child: Container(), flex: 1,),
              Expanded(child: Divider(color: Colors.black,), flex: 8,),
              Expanded(child: Container(), flex: 1,),
            ],),
            new Spacer(),
          ],
        )
      ) 
    );
  }

  Widget card(bool _loading){
    return
    CustomCard(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalSpacing(),
            CustomText("FAÇA SEU LOGIN:", ),
            VerticalSpacing(),
            Row(
              children: [
                new Spacer(),
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    enabled: !_loading,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: FontColors.lightGrey, fontSize: FontSize.normal)
                    ),
                  ),
                ),
                new Spacer(),
              ],
            ),
            VerticalSpacing(),
            Row(
              children: [
                new Spacer(),
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    enabled: !_loading,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      hintStyle: TextStyle(color: FontColors.lightGrey, fontSize: FontSize.normal)
                    ),
                  ),
                ),
                new Spacer(),
              ],
            ),
            VerticalSpacing(),
            CustomButton(child: CustomText("ENTRAR", bold: true,fontSize: FontSize.big,), onPressed: ()=>login(context), backgroundColor: UIColors.transparent,),
            VerticalSpacing(),
          ],
        )
      )
    );  
  }
  void login(BuildContext context) async {
    final loginCubit = context.read<LoginCubit>();
    loginCubit.getLogin(_emailController.text,_passwordController.text);
  }

}
