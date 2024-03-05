import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/datasources/auth_local_datasource.dart';
import 'package:flutter_agribisnisku/data/datasources/marketing_remote_datasources.dart';
import 'package:flutter_agribisnisku/presentations/home/pages/home_page.dart';
import 'package:flutter_agribisnisku/presentations/product_target/bloc/product_target/product_target_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentations/auth/bloc/login/login_bloc.dart';
import 'presentations/auth/pages/login_page.dart';
import 'presentations/business_target/bloc/business_targets/business_target_bloc.dart';
import 'presentations/marketing/bloc/marketing_target/marketing_target_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
         BlocProvider(
          create: (context) => MarketingTargetBloc(),
        ),
        BlocProvider(
          create: (context) => BusinessTargetBloc(),
        ),
        BlocProvider(
          create: (context) => ProductTargetBloc(),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot){
            if (snapshot.data != null && snapshot.data!) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          }
      ),
      ),
    );
  }
}
