import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/data/datasources/auth_local_datasource.dart';
import 'package:flutter_agribisnisku/data/datasources/marketing_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/datasources/product_remote_datasources.dart';
import 'package:flutter_agribisnisku/data/models/responses/login_response_model.dart';
import 'package:flutter_agribisnisku/presentations/business_profile/bloc/bloc/business_profile_bloc.dart';
import 'package:flutter_agribisnisku/presentations/home/pages/home_page.dart';
import 'package:flutter_agribisnisku/presentations/marketing/bloc/add_target/add_target_bloc.dart';
import 'package:flutter_agribisnisku/presentations/product_target/bloc/add_target/add_target_bloc.dart';
import 'package:flutter_agribisnisku/presentations/product_target/bloc/product_target/product_target_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/business_remote_datasource.dart';
import 'data/datasources/onboarding_local_datasource.dart';
import 'presentations/auth/bloc/login/login_bloc.dart';
import 'presentations/auth/pages/login_page.dart';
import 'presentations/business_target/bloc/add_target/add_target_bloc.dart';
import 'presentations/business_target/bloc/business_targets/business_target_bloc.dart';
import 'presentations/marketing/bloc/marketing_target/marketing_target_bloc.dart';
import 'presentations/oboarding/pages/onboarding_page.dart';

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
        BlocProvider(
          create: (context) => AddTargetBloc(MarketingRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => BusinessProfileBloc(),
        ),
        BlocProvider(
          create: (context) => AddBusinessTargetBloc(BusinessRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddProductTargetBloc(ProductRemoteDataSource()),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<LoginResponseModel>(
          future: AuthLocalDatasource().getAuthData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return FutureBuilder<bool>(
                future: OnboardingLocalDatasource().getIsFirstTime(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!
                        ? const LoginPage()
                        : const OnboardingPage();
                  } else {
                    return const OnboardingPage();
                  }
                },
              );
            }
          },
        ),
      ),
        );
  }
}
