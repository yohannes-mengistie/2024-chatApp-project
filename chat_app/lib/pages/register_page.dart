import 'package:chat_app/component/my_button.dart';
import 'package:chat_app/component/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  
  void _signUp(){}
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
            Text('Let you register',
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

             SizedBox(height: 10,),
            MyTextfield(hintText: 'confirm',
            obscureText: true,
            controller: _confirmPasswordController,),

            SizedBox(height: 25,),
            MyButton(button: 'SignUp',
            onTap: _signUp,),

            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                'have an account?',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                
              ),

              GestureDetector(
                onTap: onTap,
                child: Text('Login now',
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