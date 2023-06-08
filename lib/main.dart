import 'package:flutter/material.dart';
import 'package:mvvm/Utils/routes/routes.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view_model/anth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),

    ]);
  }
}

