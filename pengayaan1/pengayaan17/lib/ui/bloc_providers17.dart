import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan17/bloc/news_org_bloc.dart';
import 'package:pengayaan17/services.dart/news_services.dart';
import 'package:pengayaan17/ui/news_org_page.dart';

class BlocProviders17 extends StatelessWidget {
  const BlocProviders17({super.key});

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
