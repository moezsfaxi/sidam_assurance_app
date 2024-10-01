// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/features/snackbar.dart';
import 'package:sidam_assurance_app/form_components/form_label_login.dart';
import 'package:sidam_assurance_app/form_components/login_password.dart';
import 'package:sidam_assurance_app/form_components/login_text.dart';
import 'package:sidam_assurance_app/network_controllers/users_controller.dart';
import 'package:sidam_assurance_app/pages/the_grid_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {

  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
   //begin
    bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String email = _username ?? "notfound";
      String password = _password ?? "password";

      try {
        Response response = await sendwithdio(email: email , password: password);
       
        switch (response.statusCode) {
      case 200:
        if(mounted){
         if(response.data["message"]== "User doesn't exist"){
          showTopSnackBar(context,"User doesn't exist");

         } else if(response.data["message"]== "The password is wrong"){
          showTopSnackBar(context,"The password is wrong");

         } else if(response.data["message"]== "Login success"){
          SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('user_email', email);

            // Navigator.pushReplacement(
            // context,
            // MaterialPageRoute(builder: (context)=> const TheGridTest()));
            
             Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const TheGridTest()),
    (Route<dynamic> route) => false, // This removes all previous routes
  );

         }    
        }
        break;
      case 404:
        print(response.data);
        break;
      case 401:
        print(response.data);
        break;
     
      default:
        print("Unexpected status code: ${response.statusCode}");
        break;
    }

      } on DioException catch (e) {

      
        print(e.error);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
//end 
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? myvalidation(String? value){
               if(value!.isEmpty){
                return "please enter some text"; 
               } 
               return null;
            }

  @override
  Widget build(BuildContext context) {
    return   Container(
       height:MediaQuery.of(context).size.height  ,
      decoration:  BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width/20
        )

      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:  EdgeInsets.only(
              top:MediaQuery.of(context).size.height/4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const  Image(image: AssetImage("assets/images/sidam.png") ),
               const FormLabelsLogin(labelForm: "Nom d'utulisateur/E-mail") ,
                LoginText(
                  textcontroller: _usernameController,
                  hint: "Nom d'utulisateur/E-mail", 
                  myfunction: myvalidation, 
                  onSaved: (value){
                     _username = value;
                  }),
                  const FormLabelsLogin(labelForm: "mot de passe"),
                  LoginPassword(
                  passwordController: _passwordController,  
                  hint: "mot de passe", 
                  myfunction: myvalidation, 
                  onSaved: (value){
                        _password = value; 
                  }),
                  SizedBox(
                            width: double.infinity,
                            child: ElevatedButton( onPressed: ()  {       
                              
                                  _formKey.currentState!.save();
                                  _login();

                            },
                            style: ElevatedButton.styleFrom(
                               foregroundColor: Colors.white,
                               backgroundColor: const Color.fromRGBO(20, 197, 59, 1)
                            ),
                             //child:const Text("connexion")
                              child:_isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              value: 0.7,) 
                              : const Text("connexion")
                             ),      
                            ) 
              ],
            ),
          ),
        )),
     
    )   ;
  }
} 
