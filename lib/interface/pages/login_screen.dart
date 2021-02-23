import 'package:diet_controller/cubit/login_cubit.dart';
import 'package:diet_controller/interface/components/custom_card.dart';
import 'package:diet_controller/interface/components/custom_flat_button.dart';
import 'package:diet_controller/interface/components/custom_text_montserrat.dart';
import 'package:diet_controller/interface/components/loading_bar.dart';
import 'package:diet_controller/interface/components/vertical_spacing.dart';
import 'package:diet_controller/interface/components/wave_widget.dart';
import 'package:diet_controller/utils/route_constants.dart';
import 'package:diet_controller/utils/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  //animation and text controllers for the wave efect, falling text and input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  bool _loading = false;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 3), vsync: this,)..forward();
    _offsetAnimation = Tween<Offset>(begin: const Offset(0.0,-11), end: Offset.zero ).animate(CurvedAnimation(parent:_controller, curve:Curves.easeOutBack));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //stacking of the animation background and the actual screen content
      body: Stack(
        children: [
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
          Container(
            child:Padding(
              padding: EdgeInsets.all(Spacing.normal),
              child:Column(
                children: [
                  new Spacer(),
                  Row(
                    children: [
                        Text("Atlas",style: GoogleFonts.notoSans(fontSize: FontSize.mainTitle,color: UIColors.loginGradient[1]))
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Row(
                    children: [
                      SlideTransition(
                        position: _offsetAnimation, 
                        child:
                      Text("Sua vida no lugar",style: GoogleFonts.notoSans(fontSize: FontSize.big,color:Colors.white),),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  VerticalSpacing(spacing: Spacing.huge,),
                  Row(children: [
                    Expanded(child: Container(), flex: 1,),
                    Expanded(child: Divider(color: Colors.white,), flex: 8,),
                    Expanded(child: Container(), flex: 1,),
                  ],),
                  //cubit consumer control the actual widget and error messages displayed
                  BlocConsumer<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if(state is LoginSuccess){
                        Future.delayed(Duration.zero,()=>Navigator.pushReplacementNamed(context, KRoutes.splashScreen,));
                      }
                      return card();
                    }, 
                    listener: (context, state) {
                      if(state is LoginError){
                        Scaffold.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: CustomText("Algo deu errado"), backgroundColor: Colors.white,));
                        setState(() {
                          _loading = false;
                        });
                      }else if(state is LoginFailed){
                        Scaffold.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Row(mainAxisAlignment: MainAxisAlignment.center ,children:[CustomText("Email ou Senha Incorretos")]), backgroundColor: Colors.white,));
                        setState(() {
                          _loading = false;
                        });
                      }else if(state is LoginLoading){
                        setState(() {
                          _loading = true;
                        });
                      }else if(state is LoginInitial){
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                  ),
                  Row(children: [
                    Expanded(child: Container(), flex: 1,),
                    Expanded(child: Divider(color: Colors.white,), flex: 8,),
                    Expanded(child: Container(), flex: 1,),
                  ],),
                  new Spacer(),
                ],
              )
            )
          ),
        ],
      ) 
    );
  }

  //isolating the login card for a better reading
  Widget card(){
    return
    CustomCard(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            CustomButton(child: CustomText("ENTRAR", bold: true,fontSize: FontSize.big,), onPressed: ()=>login(context), backgroundColor: UIColors.transparent,disable: _loading,),
            VerticalSpacing(),
            loadingBar(_loading),
          ],
        )
      )
    );  
  }

  //isolating the loading bar
  Widget loadingBar(bool loading){
    return loading ? LoadingBar() : Container();
  }

  //getting the cubit from context and sending the login request
  void login(BuildContext context) async {
    final loginCubit = context.read<LoginCubit>();
    loginCubit.getLogin("email","password");
    // loginCubit.getLogin(_emailController.text,_passwordController.text);
  }

}
