import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/bloc/news_org_bloc.dart';
import 'package:news_api/news_services.dart/news_services.dart';
import 'package:news_api/ui/new_org_page.dart';

class BlocProviders8 extends StatelessWidget {
  const BlocProviders8({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsOrgBloc(NewsServices()),
        ),
      ],
      child: NewsOrgPage(),
    );
  }
}
