import 'package:chat_app/auth/auth_services.dart';
import 'package:chat_app/component/my_button.dart';
import 'package:chat_app/component/my_textfield.dart';
import 'package:flutter/material.dart';

class  LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
   LoginPage({super.key,required this.onTap});

   void _login(BuildContext context) async{
    final authService = AuthServices();
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,),

            SizedBox(height: 50,),
            Text('Wellcom Back Sir',
            style: TextStyle(color: Theme.of(context).colorScheme.primary,
            fontSize:16)),

            SizedBox(height: 50,),
            MyTextfield(hintText: 'Email',
            obscureText: false,
            controller: _emailController,),

            SizedBox(height: 10,),
            MyTextfield(hintText: 'Password',
            obscureText: true,
            controller: _passwordController,),

            SizedBox(height: 25,),
            MyButton(button: 'Login',
            onTap: ()=> _login(context),),

            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                'Not A memebr?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                
              ),

              GestureDetector(
                onTap: onTap,
                child: Text('signUp now',
                style: TextStyle(color: Colors.blue,
                fontWeight: FontWeight.bold),
                ),
              )
            ],)


          ],
        ),
      ),
    );
  }
}