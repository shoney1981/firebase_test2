import 'package:firebase_test/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title:Text('Sign Up'),
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
              title: 'Sign Up',
              onTap: (){
                if(_formKey.currentState!.validate()){
                    _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),


                    );
                }

              },
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                }
                    , child: Text('Login'))
              ],
            )

          ],
        ),
      ),
    );
  }
}
