import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_financial_manager/injectable/injecter.dart';

import '../cubit/plans_cubit.dart';

@RoutePage()
class PlansPage extends StatelessWidget {
  const PlansPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlansCubit>(),
      child: const _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent();

  @override
  State<_PageContent> createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
