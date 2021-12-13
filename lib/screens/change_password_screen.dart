import 'package:flutter/material.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/utils/helpers.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:project2/widgets/text_filed_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with Helper{

 late TextEditingController _oldPasswordTextEditingController;
 late TextEditingController _newPasswordTextEditingController;
 late TextEditingController _confNewPasswordTextEditingController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _oldPasswordTextEditingController= TextEditingController();
    _newPasswordTextEditingController= TextEditingController();
    _confNewPasswordTextEditingController= TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _oldPasswordTextEditingController.dispose();
    _newPasswordTextEditingController.dispose();
    _confNewPasswordTextEditingController.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextApp(text: AppLocalizations.of(context)!.change_password , fontSize: 18, fontColor: Colors.black , fontWeight: FontWeight.w500,),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(16),
          vertical: SizeConfig.scaleHeight(24),
        ),
        children: [
          TextFiledApp(hint: AppLocalizations.of(context)!.old_password , prefixIcon: Icons.lock, controller: _oldPasswordTextEditingController , obscure: true,),
          TextFiledApp(hint: AppLocalizations.of(context)!.new_password , prefixIcon: Icons.lock, controller: _newPasswordTextEditingController,  obscure: true,),
          TextFiledApp(hint: AppLocalizations.of(context)!.confirm_new_password , prefixIcon: Icons.lock, controller: _confNewPasswordTextEditingController,  obscure: true,),

          SizedBox(height: SizeConfig.scaleHeight(100),),
          ButtonApp(text: AppLocalizations.of(context)!.change , width: double.infinity, height: 59, onPressed: () async => await performChangePassword(),),
        ],
      ),
    );
  }

 Future performChangePassword() async{
   if(checkData()){
     await changePassword();
   }
 }

 bool checkData(){

   if(_oldPasswordTextEditingController.text.isNotEmpty &&
       _newPasswordTextEditingController.text.isNotEmpty &&
       _confNewPasswordTextEditingController.text.isNotEmpty){
     return checkPasswordConfirmation();
   }
   showSnackBar(context, "Check data required" , error:  true);

   return false;
 }

 bool checkPasswordConfirmation(){
   if(_newPasswordTextEditingController.text == _confNewPasswordTextEditingController.text){
     return true;
   }
   showSnackBar(context, "password is not match" , error:  true);
   return false;
 }

 Future  changePassword() async {
   bool status = await UserApiController().changePassword(context, currentPassword: _oldPasswordTextEditingController.text, newPassword: _newPasswordTextEditingController.text);
   if(status){
     Navigator.pop(context);
   }

 }
}
