


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/respositery/auth_repositery.dart';

class AuthViewModel with ChangeNotifier{
   final myRepo= AuthRepositer();

   bool _loading = false;
   bool get  loading => _loading;


   setLoading(bool value){
      _loading= value;
            notifyListeners();
   }

   Future<void>loginApi(dynamic data,BuildContext context)async {
      setLoading(true);
      myRepo.loginApi(data).then((value){
         Utils.flushBarErrorMessage("Login Successfully", context);
         setLoading(false);

         if(kDebugMode){

            print(value.toString());
         }

      }).onError((error, stackTrace) {
         setLoading(false);

         if(kDebugMode){

            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
         }

      });
   }
}