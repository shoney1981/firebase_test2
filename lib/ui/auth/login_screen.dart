import 'package:firebase_test/ui/auth/signup_screen.dart';
import 'package:firebase_test/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

@override
  void dispose() {
    // TODO: implement dispose 
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  
  void login(){
  _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text)
      .then((value){
       //Utils().toastMessage(value.user!.email.toString());
  })
      .onError((error, stackTrace){
        debugPrint(error.toString());
    Fluttertoast.showToast(msg: error.toString());

  });

  }
  
  
  
  
  @override
    Widget build(BuildContext context) {
   //quit application
    return WillPopScope(

      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:Text('Login Screen'),
        ),
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Form(
              key: _formKey,
              child: Column(
                children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                controller:  emailController,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    //helperText: 'enter email e.g. jon@gmail.com'
                    prefixIcon: Icon(Icons.alternate_email)
                ),
                  validator:(value){
                  if(value!.isEmpty){
                    return 'Enter email';
                  }
                  return null;
                  } ,
              ),

                  const SizedBox(height: 50,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller:  passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        //helperText: 'enter password'
                        prefixIcon: Icon(Icons.lock_open)
                    ),
                    validator:(value){
                      if(value!.isEmpty){
                        return 'Enter email';
                      }
                      return null;
                    } ,
                  ),
                ],
              )
          ),

                  RoundButton(
                      title: 'Login',
                    onTap: (){
                  if(_formKey.currentState!.validate()){
                      login();
                  }

                    },
                  ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen())
                  );
                  }
                      , child: Text('Sign Up'))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
