import 'package:ai_financial_manager/injectable/injecter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/ai_cubit.dart';

@RoutePage()
class AIPage extends StatelessWidget {
  const AIPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AiCubit>(),
      child: const _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent({super.key});

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
